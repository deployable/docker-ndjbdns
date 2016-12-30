# ndjbdns in docker

Puts the ndjbdns djbdns patch/port in docker

You DNS data and config will need to be overlayed on top of this image. 

Either mount `/ndjbdns/etc` or build a new image `FROM deployable/ndjbdns-tinydns` including your config.

## tinydns

The `tinydns` config is stored in `./tinydns`

    docker run -p 53:53 deployable/ndjbdns-tinydns`

## dnscache 

The `dnscache` config is stored in `./dnscache`

    docker run -p 53:53 deployable/ndjbdns-dnscache`

## Running tinydns and dnscache

If you need to run both services, you will need multiple IP addresses. Creating alias service addresses on loopback is an one way to achieve this for local use. `docker-compose.yml` provides an example running tinydns on 10.8.9.8 and dnscache on 10.8.10.8

## Build

The `make.sh` script will create a "build" image to build the app and a common "app" image to base the `tinydns` and `dnscache` images off. 

    ./make.sh

