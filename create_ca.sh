#!/usr/bin/env bash

KEY_LENGTH=$1
DAYS=$2

usage()
{
    echo "usage: ./create_ca.sh <KEY_LENGTH> <DAYS>"
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

# Create the root CA key and cert
openssl req -config ca.cnf -x509 -newkey rsa:$KEY_LENGTH -nodes -keyout ca/private/ca.key -out ca/certs/ca.crt -days $DAYS
chmod 400 ca/private/ca.key
chmod 444 ca/certs/ca.crt
