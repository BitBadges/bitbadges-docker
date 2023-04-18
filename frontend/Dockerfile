FROM node:16.13.0-alpine3.14

#Set up working directory and navigate
WORKDIR /home
ARG ACCESS_TOKEN
ARG GITHUB_USERNAME

#Install Git and SSH
RUN apk update && apk add git openssh curl make wget bash

#Clone the private repository with Git credentials
#Run git clone with trevormil:ACCESS_TOKEN
RUN git clone https://$GITHUB_USERNAME:$ACCESS_TOKEN@github.com/bitbadges/bitbadges-frontend.git

COPY --from=builder /home/bitbadges-frontend /home/bitbadges-frontend
WORKDIR /home/bitbadges-frontend


RUN npm install -g npm@9.6.4

RUN npm install
RUN npm run build

# Define an argument for the .env file
# ARG ENV_FILE

# COPY .env .
# ENV $(cat $ENV_FILE | xargs)

# #Expose relevant ports
# EXPOSE 3000

FROM nginx:1.21.3-alpine

WORKDIR /home/bitbadges-frontend

#Install NPM
RUN apk update && apk add npm
RUN npm install -g npm@9.6.4

EXPOSE 3000 80

# RUN apk update && apk add nginx curl 

#execute dummy command for cache
RUN curl https://google.com/api/v2

COPY nginx/default.conf /etc/nginx/conf.d/

EXPOSE 3000 80

# RUN curl http://localhost:3000 && exit 1

CMD ["sh", "-c", "nginx && npm run start"]

# RUN systemctl status nginx
# RUN npm install -g pm2
# RUN pm2 start --name=website npm -- start
# RUN pm2 startup systemd && exit 1
# # TODO: watever is at end
# RUN systemctl status pm2-bob
# RUN cd /etc/nginx/sites-available




# # Run npm run setup and npm run indexer
# CMD ["npm", "run", "start"]

# commands
# docker build -t bitbadges .
# docker run -it bitbadges