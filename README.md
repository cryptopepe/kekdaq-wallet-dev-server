# kekdaq-wallet-dev-server

A simple web server that's designed to help with Kekdaq Wallet development.

## Install

    npm install -g kekdaq-wallet-dev-server

## Usage

Please adjust the wallet path according to your setup. The environment variable `WALLET_PATH` should point to where the _compiled_
source of the kekdaq wallet is. And `KEKDAQBLOCKD_URL` should point to where your kekdaqblockd is running, probably including the
correct port number as in the following example:

    WALLET_PATH=kekdaqnode/kekdaq-wallet/build KEKDAQBLOCKD_URL=http://172.17.0.8:4100 kekdaq-wallet-dev-server

