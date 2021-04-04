FROM ubuntu:18.04 
LABEL maintainer="LIMXTEC developer"

COPY ./bin /usr/local/bin
COPY ./VERSION /tmp
COPY ./CHECKSUM /tmp

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget ca-certificates tar software-properties-common unzip && \
    VERSION=`cat /tmp/VERSION` && \
    wget https://github.com/dalijolijo/Megacoin/releases/download/${VERSION}/megacoin-x86_64-linux-gnu_no-wallet.tar.gz -O /tmp/prebuilt.tar.gz && \
    sha256sum /tmp/prebuilt.tar.gz && \
    echo "$(cat /tmp/CHECKSUM)  /tmp/prebuilt.tar.gz" | sha256sum -c && \
    tar xzf /tmp/prebuilt.tar.gz -C /tmp/ && \
    mv /tmp/bin/megacoind /usr/local/bin && \
    mv /tmp/bin/megacoin-cli /usr/local/bin && \
    chmod a+x /usr/local/bin/* && \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/data"]
ENV HOME /data
ENV DATA /data
WORKDIR /data

EXPOSE 7951 7952 

ENTRYPOINT ["init"]
