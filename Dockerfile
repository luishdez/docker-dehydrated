FROM ubuntu:latest
LABEL maintainer="Luis Hdez <luis.munoz.hdez@gmail.com>"

RUN apt-get update && \
    apt-get install -y curl sed grep build-essential libssl-dev libffi-dev python3-dev python3-pip python3-setuptools

RUN curl https://raw.githubusercontent.com/lukas2511/dehydrated/master/dehydrated > /bin/dehydrated && \
    chmod a+x /bin/dehydrated

RUN ln -fs /usr/bin/python3 /usr/bin/python

COPY hooks/ var/hooks/

RUN pip3 install -r var/hooks/cloudflare/requirements.txt

ENTRYPOINT ["dehydrated", "-c", "-f", "docker/ssl/letsencrypt/config/production.sh", "-o", "docker/ssl/domains"]
