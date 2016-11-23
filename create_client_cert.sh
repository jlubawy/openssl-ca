#!/usr/bin/env bash

FILENAME=$1
KEY_LENGTH=$2
DAYS=$3

usage()
{
    echo "usage: ./create_client_cert.sh <FILENAME> <KEY_LENGTH> <DAYS>"
    exit 1
}

if [ -z $FILENAME ]; then
    echo "Must provide filename"
    usage
fi

if [ -z $KEY_LENGTH ]; then
    echo "Must provide key length"
    usage
fi

if [ -z $DAYS ]; then
    echo "Must provide certificate validity in days"
    usage
fi

# Create client key
openssl genrsa -out intermediate/private/$FILENAME.key $KEY_LENGTH
chmod 400 intermediate/private/$FILENAME.key

# Create client CSR
openssl req -config intermediate.cnf -key intermediate/private/$FILENAME.key -new -sha256 -out intermediate/csr/$FILENAME.csr

# Create certificate
openssl ca -config intermediate.cnf -extensions usr_cert -days $DAYS -notext -md sha256 -in intermediate/csr/$FILENAME.csr -out intermediate/certs/$FILENAME.crt
chmod 444 intermediate/certs/$FILENAME.crt
