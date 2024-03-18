# BitBadges Docker
This repo creates a docker image for the BitBadges blockchain.

HTTPS is required for the backend authentication via Blockin and hosting the frontend via nginx, which requires
a valid SSL certificate. The certificate and key should be placed in the root directory of this repo and named
`server.cert` and `server.key` respectively. The certificate should be signed by a trusted CA.

If you do not have a certificate, you can use [Let's Encrypt](https://letsencrypt.org/) to generate one for free.


## Docs

For more info, visit the BitBadges - Run a Node documentation.

