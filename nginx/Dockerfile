# # Use the official Nginx image as a reverse proxy
FROM nginx:latest

# # Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy the custom Nginx configuration file to the container


COPY server.key /etc/nginx/ssl/server.key
COPY server.cert /etc/nginx/ssl/server.cert
COPY nginx/default.conf /etc/nginx/conf.d/


# COPY --from=builder /home/bitbadges-frontend /home/bitbadges/frontend
# WORKDIR /home/bitbadges/frontend

# # RUN cd /home/bitbadges-frontend/.next && ls -a && exit 1

# # Copy the built Next.js application to the Nginx webroot
# COPY --from=builder /home/bitbadges-frontend /home/bitbadges/frontend

# # #Install NPM
# # RUN apk update && apk add npm
# # 

# # # RUN apk update && apk add nginx curl 

# # #execute dummy command for cache

# # # RUN cd /etc/nginx/conf.d && ls && exit 1

# # COPY nginx/default.conf /etc/nginx/conf.d/
# RUN nginx -t

# COPY /home/bitbadges-frontend/.next /usr/share/nginx/html
# RUN chown -R nginx:nginx /usr/share/nginx/html

# # # RUN nginx -s reload

# EXPOSE 3000
EXPOSE 80

# # RUN curl http://localhost:3000 && exit 1
# # Expose port 80 for the nginx server
# EXPOSE 80

# Start nginx and the pm2 process
CMD [ "nginx", "-g", "daemon off;" ]
