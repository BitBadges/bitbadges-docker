FROM --platform=linux golang:1.21 AS builder

ENV COSMOS_VERSION=v0.46.7
RUN apt-get update && apt-get install -y git curl
RUN apt-get install -y make wget

WORKDIR /root
RUN git clone --depth 1 --branch ${COSMOS_VERSION} https://github.com/cosmos/cosmos-sdk.git

WORKDIR /root/cosmos-sdk/cosmovisor

RUN make cosmovisor

FROM golang:1.21 as v1

#Install dependencies
RUN apt-get update && apt-get install -y git curl
RUN apt-get install -y make wget

#Set up working directory and navigate
#Build genesis version of the chain with ignite
WORKDIR /home
RUN curl https://get.ignite.com/cli@v0.27.2 | bash
RUN mv ignite /usr/local/bin
RUN ignite version


#Clone the repository
ENV VERSION=v1.0-betanet
RUN git clone --branch ${VERSION} https://github.com/bitbadges/bitbadgeschain.git

WORKDIR /home/bitbadgeschain

RUN ignite chain build --skip-proto

WORKDIR /

ENV LOCAL=/usr/local
ENV DAEMON_NAME=bitbadgeschaind
ENV DAEMON_ALLOW_DOWNLOAD_BINARIES=false
ENV DAEMON_RESTART_AFTER_UPGRADE=true
ENV DAEMON_HOME=/root/.bitbadgeschain

RUN mkdir ${DAEMON_HOME}
RUN mkdir ${DAEMON_HOME}/cosmovisor 
RUN mkdir ${DAEMON_HOME}/cosmovisor/genesis
RUN mkdir ${DAEMON_HOME}/cosmovisor/genesis/bin
RUN mkdir ${DAEMON_HOME}/cosmovisor/upgrades

COPY --from=builder /root/cosmos-sdk/cosmovisor/cosmovisor ${LOCAL}/bin/cosmovisor

RUN mv /go/bin/bitbadgeschaind ${DAEMON_HOME}/cosmovisor/genesis/bin/bitbadgeschaind

# install npm and bip322-js
RUN apt-get update && apt-get install -y npm

WORKDIR /home/.bitbadgeschain
RUN git clone https://github.com/BitBadges/bip322-js

WORKDIR /home/.bitbadgeschain/bip322-js
RUN npm install
RUN npm run build

EXPOSE 26656 26657 26660 6060 9090 1317

ENTRYPOINT [ "cosmovisor" ]