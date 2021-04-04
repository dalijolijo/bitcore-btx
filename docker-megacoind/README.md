
# docker-megacoind

> Run a full Megacoin node with one command

A Docker configuration with sane defaults for running a full MEC node.

## Build docker image

```sh
docker build -t dalijolijo/megacoind:<VERSION> .
# Example for VERSION 1.9.9.5.1
docker build -t dalijolijo/megacoind:1.9.9.5.1 .
``` 
docker run --rm --name megacoind -v /home/.megacoin:/data -d -p 40008:40008 -p 40009:40009 dalijolijo/megacoind:1.9.9.5.1 -rpcuser=mec -rpcpassword=mec

## Start docker container

```
docker run --rm --name megacoind -v /home/.megacoin:/data -d -p 40008:40008 -p 40009:40009 dalijolijo/megacoind:<VERSION> -rpcuser=<USER> -rpcpassword=<PWD>
# Example for VERSION 1.9.9.5.1
docker run --rm --name megacoind -v /home/.megacoin:/data -d -p 40008:40008 -p 40009:40009 dalijolijo/megacoind:1.9.9.5.1 -rpcuser=mec -rpcpassword=mec
```
