FROM --platform=linux golang:1.19 AS builder

ENV COSMOS_VERSION=v0.46.7
RUN apt-get update && apt-get install -y git curl
# RUN git clone https://github.com/ignite/cli.git --depth=1
RUN apt-get install -y make wget

WORKDIR /root
RUN git clone --depth 1 --branch ${COSMOS_VERSION} https://github.com/cosmos/cosmos-sdk.git

WORKDIR /root/cosmos-sdk/cosmovisor

RUN make cosmovisor


FROM golang:1.19 as v1

#Install dependencies
RUN apt-get update && apt-get install -y git curl
RUN apt-get install -y make wget

RUN mkdir /go/bin

#Set up working directory and navigate
#Build genesis version of the chain with ignite
WORKDIR /home
RUN curl https://get.ignite.com/cli@v0.26.1 | bash
RUN mv ignite /usr/local/bin
RUN ignite version


#Clone the repository
ENV VERSION=v0.1
RUN git clone --branch ${VERSION} https://github.com/bitbadges/bitbadgeschain.git

WORKDIR /home/bitbadgeschain

RUN ignite chain init --skip-proto

WORKDIR /

ENV LOCAL=/usr/local
ENV DAEMON_HOME=/root/.bitbadgeschain
ENV DAEMON_NAME=bitbadgeschaind
ENV DAEMON_ALLOW_DOWNLOAD_BINARIES=false
ENV DAEMON_RESTART_AFTER_UPGRADE=true

RUN mkdir ${DAEMON_HOME}/cosmovisor 
RUN mkdir ${DAEMON_HOME}/cosmovisor/genesis
RUN mkdir ${DAEMON_HOME}/cosmovisor/genesis/bin
RUN mkdir ${DAEMON_HOME}/cosmovisor/upgrades

COPY --from=builder /root/cosmos-sdk/cosmovisor/cosmovisor ${LOCAL}/bin/cosmovisor
COPY /go/bin/bitbadgeschaind ${DAEMON_HOME}/cosmovisor/genesis/bin/bitbadgeschaind

ENTRYPOINT [ "cosmovisor" ]