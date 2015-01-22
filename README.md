# dogeparty-wallet-dev-server

A simple web server that's designed to help with Dogeparty Wallet development.

## Install

    npm install -g dogeparty-wallet-dev-server

## Usage

Please adjust the wallet path according to your setup. The environment variable `WALLET_PATH` should point to where the _compiled_
source of the dogeparty wallet is. And `DOGEBLOCKD_URL` should point to where your Dogeblockd is running, probably including the
correct port number as in the following example:

    WALLET_PATH=dogenode/dogeparty-wallet/build DOGEBLOCKD_URL=http://172.17.0.8:4100 dogeparty-wallet-dev-server

