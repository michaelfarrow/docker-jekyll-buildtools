FROM ubuntu

MAINTAINER "Mike Farrow" <contact@mikefarrow.co.uk>

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp

RUN apt-get update -y && \
    apt-get install -y curl git && \
    curl -sL https://deb.nodesource.com/setup | bash -  && \
    apt-get install -y nodejs make ruby ruby-dev && \
    apt-get remove --purge curl -y && \
    apt-get clean

RUN npm config set registry http://registry.npmjs.org/ && \
    npm install -g --no-optional bower@1.4.1 && \
    npm install -g --no-optional gulp@3.8.11

RUN gem install compass -v 1.0.3 && \
    gem install bundler -v 1.10.5

WORKDIR /src/build_tools
