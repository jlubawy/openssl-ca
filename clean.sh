#!/usr/bin/env bash

if [[ $1 = "confirm" ]]; then
    rm -rf ca/index.txt \
           ca/serial \
           ca/certs \
           ca/private \
           intermediate/index.txt \
           intermediate/serial \
           intermediate/certs \
           intermediate/private \
           intermediate/csr
    ./create_env.sh

else
    echo "Must confirm"
    echo "usage: ./clean.sh confirm"
fi