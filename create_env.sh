#!/usr/bin/env bash

cd ca
mkdir -p certs \
         crl \
         newcerts \
         private
chmod 700 private
touch index.txt
if [ ! -f serial ]; then
    echo 1000 > serial
fi

cd ../intermediate
mkdir -p certs \
         crl \
         csr \
         newcerts \
         private
chmod 700 private
touch index.txt
if [ ! -f serial ]; then
    echo 1000 > serial
fi
if [ ! -f crlnumber ]; then
    echo 1000 > crlnumber
fi
