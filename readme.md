# BitBadges Docker
This repo creates a docker image for everything associated with BitBadges project (indexer, frontend, 
blockchain, and couchDB). It serves the frontend via HTTPS (no need to specify a port)
through [nginx](https://www.nginx.com/). The backend will be served from port 3001.

Note that currently this builds everything brand new (genesis blockchain). We will be adding the ability
to connect to an existing blockchain and save your progress in the future.

HTTPS is required for the backend authentication via Blockin and hosting the frontend via nginx, which requires
a valid SSL certificate. The certificate and key should be placed in the root directory of this repo and named
`server.cert` and `server.key` respectively. The certificate should be signed by a trusted CA.

If you do not have a certificate, you can use [Let's Encrypt](https://letsencrypt.org/) to generate one for free.

## Getting Started
Create the following files (replacing your details) in the root directory:

local.ini
```ini
[admins]
admin = yourpassword

[httpd]
bind_address = 0.0.0.0
port = 5984

[log]
level = info
```

.env
```bash
RPC_URL="http://blockchain:26657"
INFURA_ID="..."
INFURA_SECRET_KEY="..."
INFURA_API_KEY="..."
DB_URL="http://user:password@couchdb:5984"
SESSION_SECRET='...'
FAUCET_MNEMONIC="metal party ...."
FAUCET_ADDRESS="cosmos1..."
```

frontend.env
```bash
BITBADGES_IO=false #true if you want to use the official bitbadges.io domain / indexer
```

server.cert
```bash
-----BEGIN CERTIFICATE-----
...
-----END CERTIFICATE-----
```

server.key
```bash
-----BEGIN RSA PRIVATE KEY-----
...
-----END RSA PRIVATE KEY-----
```

Then run the following command:
```bash
docker compose build --build-arg COUCHDB_USER=user --build-arg COUCHDB_PASSWORD=password
```

## Running
```bash
docker compose up
```

