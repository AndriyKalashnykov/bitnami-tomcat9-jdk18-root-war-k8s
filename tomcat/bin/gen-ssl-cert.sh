#!/bin/bash

set -x
set -e

CONF_DIR=../conf/

rm -f rootCA.* localhost.*

openssl genrsa -aes128 -passout file:passphrase.txt -out $CONF_DIR\rootCA.key 2048
openssl req -passin file:passphrase.txt -x509 -new -nodes -key $CONF_DIR\rootCA.key -sha256 -days 7230 -subj "/C=US/ST=FL/L=Miami/O=VMware/CN=localhost" -out $CONF_DIR\rootCA.pem
openssl req -new -sha256 -nodes -out $CONF_DIR\localhost.csr -newkey rsa:2048 -keyout $CONF_DIR\localhost.key -config <(cat csr.cnf)
openssl  x509 -req -passin file:passphrase.txt -in $CONF_DIR\localhost.csr -CA $CONF_DIR\rootCA.pem -CAkey $CONF_DIR\rootCA.key -CAcreateserial -out $CONF_DIR\localhost.crt -days 7230 -sha256 -extfile v3.ext

rm -f .srl