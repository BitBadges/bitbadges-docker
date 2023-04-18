FROM node:16.13.0-alpine3.14

#Set up working directory and navigate
WORKDIR /home
ARG ACCESS_TOKEN
ARG GITHUB_USERNAME

#Install Git and SSH
RUN apk update && apk add git openssh curl make wget bash

#Clone the private repository with Git credentials
#Run git clone with trevormil:ACCESS_TOKEN
RUN curl https://google.com/api/v5

RUN git clone https://$GITHUB_USERNAME:$ACCESS_TOKEN@github.com/bitbadges/bitbadges-indexer.git

WORKDIR /home/bitbadges-indexer

RUN npm install 
RUN npm run build

# Define an argument for the .env file
ARG ENV_FILE

COPY server.cert .
COPY server.key .
COPY .env .





ENV $(cat $ENV_FILE | xargs)

#Expose relevant ports
EXPOSE 3001

# Run npm run setup and npm run indexer
CMD ["npm", "run", "setup-and-run"]

# commands
# docker build -t bitbadges .
# docker run -it bitbadges

