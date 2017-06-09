FROM ubuntu:latest
MAINTAINER Luis Hdez <luis.munoz.hdez@gmail.com>

RUN apt-get update && \
    apt-get install -y curl sed grep mktemp

RUN curl https://raw.githubusercontent.com/lukas2511/dehydrated/master/dehydrated > /bin/dehydrated && \
    chmod a+x /bin/dehydrated

ENTRYPOINT ["dehydrated", "-c", "-f", "docker/nginx/letsencrypt/config/production.sh", "-o", "docker/nginx/ssl"]
