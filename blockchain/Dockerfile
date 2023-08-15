FROM golang:1.19

#Install Git
RUN apt-get update && apt-get install -y git curl

#Set up working directory and navigate
WORKDIR /home

#Install Ignite CLI
RUN curl https://get.ignite.com! | bash
RUN git clone https://github.com/ignite/cli.git --depth=1 --branch v0.26.1
RUN cd cli && make install
RUN ignite version
# RUN go install cosmossdk.io/tools/cosmovisor/cmd/cosmovisor@latest

#Clone the repository
RUN git clone https://github.com/bitbadges/bitbadgeschain.git

# RUN git clone https://github.com/ignite/cli.git --depth=1
RUN apt-get install -y make wget

WORKDIR /home/bitbadgeschain

# ENV DAEMON_HOME=/root/.bitbadgeschain
# ENV DAEMON_NAME=bitbadgeschaind
# ENV DAEMON_ALLOW_DOWNLOAD_BINARIES=true

RUN ignite chain init --skip-proto

# RUN mkdir -p /root/.bitbadgeschain/cosmovisor
# RUN chmod -R 777 /root/.bitbadgeschain/cosmovisor
# RUN cosmovisor init /go/bin/bitbadgeschaind
# RUN cosmovisor version
# RUN chmod -R 777 /root/.bitbadgeschain/cosmovisor

#Expose relevant ports
EXPOSE 26657
EXPOSE 26656
EXPOSE 6060 
EXPOSE 9090 
EXPOSE 1317

# RUN cosmovisor run start --api.enable --pruning nothing

# #Create .service file
# RUN touch /etc/systemd/system/bitbadgeschain.service
# RUN echo "[Unit]" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "Description=BitBadgesChain" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "After=network-online.target" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "Requires=network-online.target" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "[Service]" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "User=root" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "ExecStart=cosmovisor start --api.enable --pruning nothing" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "Restart=always" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "RestartSec=3" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "LimitNOFILE=4096" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "Environment=\"DAEMON_NAME=bitbadgeschaind\"" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "Environment=\"DAEMON_HOME=/root/.bitbadgeschain\"" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "Environment=\"DAEMON_ALLOW_DOWNLOAD_BINARIES=true\"" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "Environment=\"DAEMON_RESTART_AFTER_UPGRADE=true\"" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "[Install]" >> /etc/systemd/system/bitbadgeschain.service
# RUN echo "WantedBy=multi-user.target" >> /etc/systemd/system/bitbadgeschain.service

# #Install systemctl for Ubuntu

# RUN systemctl daemon-reload
# RUN systemctl enable bitbadgeschain.service
# RUN systemctl start myprojectd

ENTRYPOINT ["bitbadgeschaind", "start", "--api.enable", "--pruning", "nothing"]


