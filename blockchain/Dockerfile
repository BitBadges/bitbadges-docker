FROM ignitehq/cli:v0.26.1

#Install Git
# RUN apt-get update && apt-get install -y git curl
# # RUN git clone https://github.com/ignite/cli.git --depth=1
# RUN apt-get install -y make wget

#Set up working directory and navigate
WORKDIR /home

#Clone the repository
RUN git clone https://github.com/bitbadges/bitbadgeschain.git

WORKDIR /home/bitbadgeschain

RUN ignite chain init --skip-proto

ENTRYPOINT ["bitbadgeschaind"]