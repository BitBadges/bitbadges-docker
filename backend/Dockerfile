FROM node:16.13.0-alpine3.14

#Set up working directory and navigate
WORKDIR /home
ARG ACCESS_TOKEN
ARG GITHUB_USERNAME

#Install Git and SSH
RUN apk update && apk add git openssh curl make wget bash

#Clone the private repository with Git credentials
RUN git clone https://$GITHUB_USERNAME:$ACCESS_TOKEN@github.com/bitbadges/bitbadges-indexer.git

WORKDIR /home/bitbadges-indexer

RUN npm install --legacy-peer-deps
RUN npm run build

# Define an argument for the .env file
ARG ENV_FILE

COPY .env .

ENV $(cat $ENV_FILE | xargs)

#Expose relevant ports
EXPOSE 3001

# Run npm run setup and npm run indexer
ENTRYPOINT ["npm", "run"]
