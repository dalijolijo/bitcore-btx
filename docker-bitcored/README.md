
# docker-bitcored

> Run a full Bitcore node with one command

A Docker configuration with sane defaults for running a full BTX node.

## Build docker image

```sh
docker build -t dalijolijo/bitcored:<VERSION> .
# Example for VERSION 0.15.2.1
docker build -t dalijolijo/bitcored:0.15.2.1 .
``` 
docker run --rm --name bitcored -v /home/.bitcore:/data -d -p 40008:40008 -p 40009:40009 dalijolijo/bitcored:0.15.2.1 -rpcuser=btx -rpcpassword=btx

## Start docker container

```
docker run --rm --name bitcored -v /home/.bitcore:/data -d -p 40008:40008 -p 40009:40009 dalijolijo/bitcored:<VERSION> -rpcuser=<USER> -rpcpassword=<PWD>
# Example for VERSION 0.15.2.1
docker run --rm --name bitcored -v /home/.bitcore:/data -d -p 40008:40008 -p 40009:40009 dalijolijo/bitcored:0.15.2.1 -rpcuser=btx -rpcpassword=btx
```
