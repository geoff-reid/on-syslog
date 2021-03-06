# Copyright 2016, EMC, Inc.

ARG repo=rackhd
ARG tag=devel

FROM ${repo}/on-core:${tag} 

COPY . /RackHD/on-syslog/
WORKDIR /RackHD/on-syslog

RUN mkdir -p ./node_modules \
  && ln -s /RackHD/on-core ./node_modules/on-core \
  && ln -s /RackHD/on-core/node_modules/di ./node_modules/di \
  && npm install --ignore-scripts --production

EXPOSE 514/udp
CMD [ "node", "/RackHD/on-syslog/index.js" ]
