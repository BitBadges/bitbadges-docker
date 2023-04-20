FROM couchdb:latest

#Execute dummy command for cache
RUN curl https://google.com/api/v3

# Optionally, you can copy a local.ini file that sets up additional configurations
COPY local.ini /opt/couchdb/etc/local.d/local.ini