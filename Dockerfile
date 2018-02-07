FROM alpine:3.7

MAINTAINER IvoNet <Webmaster@IvoNet.nl>
WORKDIR /blog

RUN apk add --no-cache curl nodejs nodejs-npm git &&\
    mkdir -p /blog &&\
    mkdir -p /scripts &&\
    npm install -g hexo-cli

ADD entrypoint.sh /entrypoint.sh

ENV EDGE="0"
EXPOSE 4000
VOLUME ["/blog", "/scripts"]
ENTRYPOINT ["/entrypoint.sh", "hexo", "server", "--ip", "0.0.0.0", "--static"]