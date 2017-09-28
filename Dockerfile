FROM ubuntu:latest
MAINTAINER Luis Hdez <luis.munoz.hdez@gmail.com>

RUN apt-get update && \
    apt-get install -y curl sed grep mktemp build-essential libssl-dev libffi-dev python3-dev python3-setuptools

RUN easy_install3 pip

RUN curl https://raw.githubusercontent.com/lukas2511/dehydrated/master/dehydrated > /bin/dehydrated && \
    chmod a+x /bin/dehydrated

RUN ln -fs /usr/bin/python3 /usr/bin/python

COPY hooks/ var/hooks/

RUN pip install -r var/hooks/cloudflare/requirements.txt

ENTRYPOINT ["dehydrated", "-c", "-f", "docker/nginx/letsencrypt/config/production.sh", "-o", "docker/nginx/ssl"]
