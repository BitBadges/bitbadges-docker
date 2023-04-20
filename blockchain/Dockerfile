FROM golang:1.19

#Install Git
RUN apt-get update && apt-get install -y git curl

#Set up working directory and navigate
WORKDIR /home

#Clone the repository
RUN git clone https://github.com/bitbadges/bitbadgeschain.git

# RUN git clone https://github.com/ignite/cli.git --depth=1
RUN apt-get install -y make wget

#Install Go 1.19
# RUN wget https://golang.org/dl/go1.19.linux-amd64.tar.gz
# RUN tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz
# RUN export PATH=$PATH:/usr/local/go/bin

#Install Ignite CLI
RUN curl https://get.ignite.com! | bash
RUN git clone https://github.com/ignite/cli.git --depth=1 --branch v0.26.1
RUN cd cli && make install
RUN ignite version

WORKDIR /home/bitbadgeschain

#Expose relevant ports
EXPOSE 26657
EXPOSE 26656
EXPOSE 6060 
EXPOSE 9090 
EXPOSE 1317

# RUN ignite doctor

WORKDIR /home/bitbadgeschain

ENTRYPOINT ["ignite", "chain", "serve"]