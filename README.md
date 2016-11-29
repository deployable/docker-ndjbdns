# ndjbdns in docker

Puts the ndjbdns djbdns patch/port in docker

## Build

The `make.sh` script will create a "build" image to build the app and a common "app" image to base the `tinydns` and `dnscache` images off. 

`./make.sh`

## tinydns

The `tinydns` config is stored in `./tinydns`

`docker run d/ndjbdns-tinydns`

## dnscache 

The `dnscache config is stored in `./dnscache`

`docker run d/ndjbdns-dnscache`

