#!/bin/bash
openssl genrsa -des3 -out server.key 1024
openssl req -new -key server.key -out server.csr
openssl x509 -req -days 365 -in server.csr -signkey server.key -out $1.crt
cp server.key server.key.org
openssl rsa -in server.key.org -out $1.key
echo "$1.key generated with $1.crt"
mv $1.crt data/certs/$1.crt
mv $1.key data/certs/$1.key
rm server.key
rm server.key.org
rm server.csr



