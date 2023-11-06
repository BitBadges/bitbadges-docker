FROM --platform=linux golang:1.18.7-alpine AS builder

ENV COSMOS_VERSION=v0.46.7

RUN apk update
RUN apk add make git

WORKDIR /root
RUN git clone --depth 1 --branch ${COSMOS_VERSION} https://github.com/cosmos/cosmos-sdk.git

WORKDIR /root/cosmos-sdk/cosmovisor

RUN make cosmovisor

FROM --platform=linux bitbadges-docker-blockchain:latest AS v1
FROM --platform=linux alpine

ENV LOCAL=/usr/local
ENV DAEMON_HOME=/root/.bitbadgeschain-upgrade
ENV DAEMON_NAME=bitbadgeschain
ENV DAEMON_ALLOW_DOWNLOAD_BINARIES=false
ENV DAEMON_RESTART_AFTER_UPGRADE=true

COPY --from=builder /root/cosmos-sdk/cosmovisor/cosmovisor ${LOCAL}/bin/cosmovisor
COPY --from=v1 /usr/local/bin/bitbadgeschain $DAEMON_HOME/cosmovisor/genesis/bin/bitbadgeschain
# COPY --from=v1.1 /usr/local/bin/bitbadgeschaind $DAEMON_HOME/cosmovisor/upgrades/v1tov1_1/bin/checkersd
# COPY --from=v2 /usr/local/bin/checkersd $DAEMON_HOME/cosmovisor/upgrades/v1_1tov2/bin/checkersd

ENTRYPOINT [ "cosmovisor" ]