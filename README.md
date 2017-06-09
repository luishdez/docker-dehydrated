# Docker Dehydrated

Just a simple docker container with Dehydrated ready to renew SSL keys

This docker expects that your account is registered and domains are already
validated

## Basics

By default will load `docker/nginx/letsencrypt/config/production.sh` as
dehydrated config file but this can be override with `-f file.sh`

SSL keys will be export to `docker/nginx/ssl`, this can be override with
`-o /path`

Following wobblecode projects, the default file tree is:

```
- /docker/
  - nginx/
    - letsencrypt/
      - config/
        - production.sh
    - ssl (out)
      - domain.com
        - fullchain.pem
        …
```

You can override any dehydrated parameter

## Run for renew

You need to pass with -d the list of domains or set a domains.txt file in the
same path as the config.sh file loaded

```sh
docker run \
-v ${PWD}/docker/nginx/:/docker/nginx \
wobblecode/docker-dehydrated \
-d "wobblecode.com ws.wobblecode.com www.wobblecode.com"
```

## Build

```sh
docker build -t wobblecode/docker-dehydrated:latest .
```

## Push

```sh
docker tag wobblecode/docker-dehydrated wobblecode/docker-dehydrated:latest
docker push wobblecode/docker-dehydrated:latest
```
