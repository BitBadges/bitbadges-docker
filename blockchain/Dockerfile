FROM golang:1.19

#Install Git
RUN apt-get update && apt-get install -y git curl
# RUN git clone https://github.com/ignite/cli.git --depth=1
RUN apt-get install -y make wget

#Set up working directory and navigate
WORKDIR /home

#Install Ignite CLI
RUN curl https://get.ignite.com! | bash
RUN git clone https://github.com/ignite/cli.git --depth=1 --branch v0.26.1
RUN cd cli && make install
RUN ignite version

#Clone the repository
RUN git clone https://github.com/bitbadges/bitbadgeschain.git

WORKDIR /home/bitbadgeschain

RUN ignite chain init --skip-proto

ENTRYPOINT ["bitbadgeschaind"]