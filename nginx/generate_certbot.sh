#!/bin/bash

echo
echo "When asked for document root, use this.."
echo "/itconquest/certbot-sites/docroot"

echo
echo "Make sure your docker container hosting the website is "
echo "turned off. If your host name is not any of *.sandbox3000.com, "
echo "then you need to add that host entry into certbot-sites docker compose virtual host"
echo
echo

sudo rm -rf /etc/letsencrypt/live/$1
sudo certbot certonly -d $1
sudo cp /etc/letsencrypt/live/$1/fullchain.pem /itconquest/nginx/data/certs/$1.crt
sudo cp /etc/letsencrypt/live/$1/privkey.pem /itconquest/nginx/data/certs/$1.key

