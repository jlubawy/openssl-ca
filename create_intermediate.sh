#!/usr/bin/env bash

KEY_LENGTH=$1
DAYS=$2

usage()
{
    echo "usage: ./create_intermediate.sh <KEY_LENGTH> <DAYS>"
    exit 1
}

if [ -z $KEY_LENGTH ]; then
    echo "Must provide key length"
    usage
fi

if [ -z $DAYS ]; then
    echo "Must provide certificate validity in days"
    usage
fi

# Create intermediate key
openssl genrsa -out intermediate/private/intermediate.key $KEY_LENGTH
chmod 400 intermediate/private/intermediate.key

# Create intermediate certificate request
openssl req -config intermediate.cnf -new -sha256 -key intermediate/private/intermediate.key -out intermediate/csr/intermediate.csr

# Sign the intermediate certificate
openssl ca -config ca.cnf -extensions v3_intermediate_ca -days $DAYS -notext -md sha256 -in intermediate/csr/intermediate.csr -out intermediate/certs/intermediate.crt
chmod 444 intermediate/certs/intermediate.crt
