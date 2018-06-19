# setup a centos image with bitcore binary components
FROM centos:latest
MAINTAINER The Bitcore BTX Core Developers
RUN yum -y install git curl which xz tar findutils
RUN groupadd btxcore
RUN useradd btxcore -m -s /bin/bash -g btxcore
ENV HOME /home/btxcore
USER btxcore
RUN curl -o- https://raw.githubusercontent.com/dalijolijo/bitcore-docker/master/install.sh | bash
RUN /bin/bash -l -c "nvm install v10 && nvm alias default v10"
RUN /bin/bash -l -c "npm install btxcore -g"
