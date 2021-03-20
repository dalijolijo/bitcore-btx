# Bitcore
![Circle CI](https://circleci.com/gh/bitpay/bitcore/tree/master.svg?style=shield)

**Infrastructure to build Bitcoin and blockchain-based applications for the next generation of financial technology.**

## Easy Setup Guide for BTX (with docker-compose)

<details>
<summary>Checkout the repo bitcore-btx</summary>
<br>
  
```sh
git clone https://github.com/dalijolijo/bitcore-btx.git
cd bitcore-btx
git checkout master
```

</details>

<details>
<summary>Install docker.io and docker-compose v.3</summary>
<br>
  
```sh
cd bitcore-btx
./install_docker.sh
```

</details>

<details>
<summary>Modify Insight IP in docker-compose.yml file</summary>
<br>

Change ```YOUR_IP``` in environment variable ``- "API_PREFIX=http://YOUR_IP:3000/api"``

```json
  insight:
    image: insight
    build:
      context: .
      dockerfile: ./Dockerfile.insight.btx
    container_name: insight
    restart: always
    networks:
      insight-net:
        ipv4_address: 172.21.0.14
    ports:
      - 80:80
    environment:
      - "ENV=prod"
      - "CHAIN=BTX"
      - "NETWORK=mainnet"
      - "API_PREFIX=http://YOUR_IP:3000/api"
    depends_on:
      - bitcore-node
```

</details>

<details>
<summary>Starting Bitcore-Node, BTX Node, Mongo DB and Insight in Docker Containers</summary>
<br>

```sh
cd bitcore-btx
docker-compose up -d
```

</details>


<details>
<summary>Show logging of docker containers</summary>
<br>

```sh
#show all running docker containers
docker ps

#show logs of all docker containers
docker-compose logs -f

#show only a specific docker container log
docker logs -f <DOCKER NAME>
```

</details>

<details>
<summary>Check Insight and API in your browser</summary>
<br>


* Insight: http://YOUR-IP
* API: http://YOUR-IP:3000/api/status/enabled-chains

Find the REST API Documentation with examples [here](./packages/bitcore-node/docs/api-documentation.md)

</details>


## Getting Started on Ubuntu (without docker-compose)

### Requirements

- Trusted P2P Peer
- MongoDB Server >= v3.4
- docker-compose v3
- Node.js v8

### Preparations

<details>
<summary>Checkout the repo bitcore-btx</summary>
<br>
  
```sh
git clone https://github.com/dalijolijo/bitcore-btx.git
cd bitcore-btx
git checkout master
npm install -g [--unsafe-perm]
```

Hint: After error, cleanup with:
```sh
npm cache clean --force
rm -rf ./node_modules
rm -rf packages/*/node_modules
```

</details>

<details>
<summary>Install docker-compose v3</summary>
<br>

```sh
./install_docker.sh
```

</details>

<details>
<summary>Install Node.js v18</summary>
<br>

```sh
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install nodejs
```

</details>

## Setup Guide for BTX

### 1. Setup Bitcore config for BTX

<details>
<summary>Configfile bitcore.config.json for BTX Mainnet</summary>
<br>

```json
{
  "bitcoreNode": {
    "chains": {
      "BTX": {
        "mainnet": {
          "parentChain": "BTC",
          "forkHeight": 492820,
          "trustedPeers": [
            {
              "host": "127.0.0.1",
              "port": 40008
            }
          ],
          "rpc": {
            "host": "127.0.0.1",
            "port": 40009,
            "username": "username",
            "password": "password"
          }
        }
      }
    }
  }
}
```

</details>

### 2. Setup BTX Node

<details>
<summary>Build Docker Image for BTX Node</summary>

```sh
cd bitcore-btx/docker-bitcored
docker build -t dalijolijo/bitcored:<VERSION> .
# Example for VERSION 0.15.2.1
docker build -t dalijolijo/bitcored:0.15.2.1 .
```

</details>

### 3. Run BTX Node

<details>
<summary>Starting BTX Node Docker Container</summary>

```sh
cd bitcore-btx/docker-bitcored
docker run --rm --name bitcored -v /home/.bitcore:/data -d -p 40008:40008 -p 40009:40009 dalijolijo/bitcored:<VERSION> -rpcuser=<USER> -rpcpassword=<PWD>
# Example for VERSION 0.15.2.1
docker run --rm --name bitcored -v /home/.bitcore:/data -d -p 40008:40008 -p 40009:40009 dalijolijo/bitcored:0.15.2.1 -rpcuser=btx -rpcpassword=btx
```

</details>

<details>
<summary>Check if BTX Node is fully synced</summary>

```sh
docker logs --tail 30 bitcored
```

</details>

### 4. Start MongoDB Server with docker-compose

<details>
<summary>Configfile docker-compose.yml for MongoDB Server</summary>
<br>

```yml
version: '3'
services:
  database:
    image: mongo:3.4-jessie
    ports:
    - 27017:27017
    volumes:
    - /data/db:/data/db
```

</details>

<details>
<summary>Starting MongoDB Server Docker Container</summary>
<br>

```sh
cd bitcore-btx
docker-compose up -d
docker-compose logs
```

</details>

### 5. Start Bitcore

<details>
<summary>Starting Bitcore</summary>
<br>
  
```sh
npm run node
```

</details>


## Setup Guide for BTC

### 1. Setup Bitcore config

<details>
<summary>Example bitcore.config.json</summary>
<br>

```json
{
  "bitcoreNode": {
    "chains": {
      "BTC": {
        "mainnet": {
          "chainSource": "p2p",
          "trustedPeers": [
            {
              "host": "127.0.0.1",
              "port": 20008
            }
          ],
          "rpc": {
            "host": "127.0.0.1",
            "port": 20009,
            "username": "username",
            "password": "password"
          }
        },
        "regtest": {
          "chainSource": "p2p",
          "trustedPeers": [
            {
              "host": "127.0.0.1",
              "port": 20020
            }
          ],
          "rpc": {
            "host": "127.0.0.1",
            "port": 20021,
            "username": "username",
            "password": "password"
          }
        }
      },
      "BCH": {
        "mainnet": {
          "parentChain": "BTC",
          "forkHeight": 478558,
          "trustedPeers": [
            {
              "host": "127.0.0.1",
              "port": 30008
            }
          ],
          "rpc": {
            "host": "127.0.0.1",
            "port": 30009,
            "username": "username",
            "password": "password"
          }
        },
        "regtest": {
          "chainSource": "p2p",
          "trustedPeers": [
            {
              "host": "127.0.0.1",
              "port": 30020
            }
          ],
          "rpc": {
            "host": "127.0.0.1",
            "port": 30021,
            "username": "username",
            "password": "password"
          }
        }
      },
      "BTX": {
        "mainnet": {
          "parentChain": "BTC",
          "forkHeight": 492820,
          "trustedPeers": [
            {
              "host": "127.0.0.1",
              "port": 40008
            }
          ],
          "rpc": {
            "host": "127.0.0.1",
            "port": 40009,
            "username": "username",
            "password": "password"
          }
        },
        "regtest": {
          "chainSource": "p2p",
          "trustedPeers": [
            {
              "host": "127.0.0.1",
              "port": 40020
            }
          ],
          "rpc": {
            "host": "127.0.0.1",
            "port": 40021,
            "username": "username",
            "password": "password"
          }
        }
      }
    }
  }
}
```

</details>

### 2. Setup Bitcoin Node

<details>
<summary>Example Bitcoin Mainnet Config</summary>

```sh
whitelist=127.0.0.1
txindex=0
listen=1
server=1
irc=1
upnp=1

# Make sure port & rpcport matches the
# bitcore.config.json ports for BTC mainnet

# if using Bitcoin Core v0.17+ prefix
# [main]

port=20008
rpcport=20009
rpcallowip=127.0.0.1

rpcuser=username
rpcpassword=password
```

</details>

### 3. Run Bitcoin node

<details>
<summary>Example Starting a Bitcoin Node</summary>

```sh
# Path to your bitcoin application and path to the config above
/Applications/Bitcoin-Qt.app/Contents/MacOS/Bitcoin-Qt -datadir=/Users/username/blockchains/bitcoin-core/networks/mainnet/
```

</details>

### 4. Start Bitcore

<details>
<summary>Starting Bitcore</summary>
<br>
  
```sh
npm run node
```

</details>

## Applications

- [Bitcore Node](packages/bitcore-node) - A full node with extended capabilities using Bitcoin Core
- [Bitcore Wallet](packages/bitcore-wallet) - A command-line based wallet client
- [Bitcore Wallet Client](packages/bitcore-wallet-client) - A client for the wallet service
- [Bitcore Wallet Service](packages/bitcore-wallet-service) - A multisig HD service for wallets
- [Bitpay Wallet](https://github.com/bitpay/copay) - An easy-to-use, multiplatform, multisignature, secure bitcoin wallet
- [Insight](packages/insight) - A blockchain explorer web user interface

## Libraries

- [Bitcore Channel](https://github.com/bitpay/bitcore-channel) - Micropayment channels for rapidly adjusting bitcoin transactions
- [Bitcore ECIES](https://github.com/bitpay/bitcore-ecies) - Uses ECIES symmetric key negotiation from public keys to encrypt arbitrarily long data streams
- [Bitcore Lib](packages/bitcore-lib) - A pure and powerful JavaScript Bitcoin library
- [Bitcore Lib Cash](packages/bitcore-lib-cash) - A pure and powerful JavaScript Bitcoin Cash library
- [Bitcore Lib BTX](packages/bitcore-lib-btx) - A pure and powerful JavaScript Bitcore BTX library
- [Bitcore Message](https://github.com/bitpay/bitcore-message) - Bitcoin message verification and signing
- [Bitcore Mnemonic](packages/bitcore-mnemonic) - Implements mnemonic code for generating deterministic keys
- [Bitcore P2P](packages/bitcore-p2p) - The peer-to-peer networking protocol for BTC
- [Bitcore P2P Cash](packages/bitcore-p2p-cash) - The peer-to-peer networking protocol for BCH
- [Bitcore P2P BTX](packages/bitcore-p2p-btx) - The peer-to-peer networking protocol for BTX
- [Crypto Wallet Core](packages/crypto-wallet-core) - A coin-agnostic wallet library for creating transactions, signing, and address derivation

## Extras

- [Bitcore Build](packages/bitcore-build) - A helper to add tasks to gulp
- [Bitcore Client](packages/bitcore-client) - A helper to create a wallet using the bitcore-v8 infrastructure

## Contributing

See [CONTRIBUTING.md](https://github.com/bitpay/bitcore/blob/master/Contributing.md) on the main bitcore repo for information about how to contribute.

## License

Code released under [the MIT license](https://github.com/bitpay/bitcore/blob/master/LICENSE).

Copyright 2013-2019 BitPay, Inc. Bitcore is a trademark maintained by BitPay, Inc.
