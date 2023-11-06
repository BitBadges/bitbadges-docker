FROM golang:1.19 as v1

#Install Git
RUN apt-get update && apt-get install -y git curl
# RUN git clone https://github.com/ignite/cli.git --depth=1
RUN apt-get install -y make wget

#Set up working directory and navigate
WORKDIR /home
RUN curl https://get.ignite.com/cli@v0.26.1 | bash
RUN mv ignite /usr/local/bin
RUN ignite version

ENV VERSION=v0.1

#Clone the repository
RUN git clone --branch ${VERSION} https://github.com/bitbadges/bitbadgeschain.git

WORKDIR /home/bitbadgeschain

RUN ignite chain init --skip-proto

WORKDIR /

FROM --platform=linux golang:1.18.7-alpine AS builder

ENV COSMOS_VERSION=v0.46.7

RUN apk update
RUN apk add make git

WORKDIR /root
RUN git clone --depth 1 --branch ${COSMOS_VERSION} https://github.com/cosmos/cosmos-sdk.git

WORKDIR /root/cosmos-sdk/cosmovisor

RUN make cosmovisor

FROM --platform=linux alpine

ENV LOCAL=/usr/local
ENV DAEMON_HOME=/root/.bitbadgeschain
ENV DAEMON_NAME=bitbadgeschaind
ENV DAEMON_ALLOW_DOWNLOAD_BINARIES=false
ENV DAEMON_RESTART_AFTER_UPGRADE=true

RUN mkdir ${DAEMON_HOME}
RUN mkdir ${DAEMON_HOME}/cosmovisor 
RUN mkdir ${DAEMON_HOME}/cosmovisor/genesis
RUN mkdir ${DAEMON_HOME}/cosmovisor/genesis/bin
RUN mkdir ${DAEMON_HOME}/cosmovisor/upgrades
RUN mkdir ${DAEMON_HOME}/cosmovisor/genesis/bin/${DAEMON_NAME}

COPY --from=v1 /root/.bitbadgeschain/data /root/.bitbadgeschain/data 
COPY --from=v1 /root/.bitbadgeschain/config /root/.bitbadgeschain/config
COPY --from=builder /root/cosmos-sdk/cosmovisor/cosmovisor ${LOCAL}/bin/cosmovisor
COPY --from=v1 /go/bin/bitbadgeschaind ${DAEMON_HOME}/cosmovisor/genesis/bin/bitbadgeschaind

RUN ${DAEMON_HOME}/cosmovisor/genesis/bin/bitbadgeschaind status && exit 1

ENTRYPOINT [ "cosmovisor" ]