#!/usr/bin/env bash

if [[ $1 = "confirm" ]]; then
    rm -rf ca/index.txt \
           ca/serial \
           ca/certs/ca.crt \
           ca/private/ca.key \
           intermediate/index.txt \
           intermediate/serial \
           intermediate/certs/intermediate.crt \
           intermediate/private/intermediate.key \
           intermediate/csr/intermediate.csr
    ./create_env.sh

else
    echo "Must confirm"
    echo "usage: ./clean.sh confirm"
fi