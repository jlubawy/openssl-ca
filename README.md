# OpenSSL CA Helper Scripts

Helper scripts to create a self-signed CA based on the article at: https://jamielinux.com/docs/openssl-certificate-authority/create-the-intermediate-pair.html.

To create a CA:

    ./create_env.sh
    ./create_ca.sh 4096 7300
    ./create_intermediate.sh 2048 365

To clean up and start over run:

    ./clean.sh confirm
