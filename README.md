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
      - domains/
        - domain.com/
          - production.sh
          - domains.txt
    - ssl (out)
      - domain.com/
        - fullchain.pem
        …
```

You can override any dehydrated parameter

## Run for renew

Domains are defined in `domains.txt`in the same path as the
config file, you can override with the arg -d Eg.
`-d "domain.com www.domain.com`

```sh
docker run -v ${PWD}/docker/nginx/:/docker/nginx wobblecode/docker-dehydrated \
-f /docker/nginx/letsencrypt/domains/wobblecode.com/production.sh
```

## Hook Cloudflare

## Docker Build

```sh
docker build -t wobblecode/docker-dehydrated:latest .
```

## Docker Push

```sh
docker tag wobblecode/docker-dehydrated wobblecode/docker-dehydrated:latest
docker push wobblecode/docker-dehydrated:latest
```
