#!/usr/bin/env bash

set -uexo pipefail

#$rundir = $(readlink -f "${0%/*}")
which greadlink >/dev/null 2>/dev/null && readlink=greadlink || readlink=readlink
rundir=$($readlink -f "${0%/*}")

SCOPE='d'
NAME='ndjbdns'
VERSION="1.06"
PKG_NAME="ndjbdns-${VERSION}"
PKG_FILE="${PKG_NAME}.tar.gz"
PKG_BUILD_FILE=${PKG_NAME}-build.tar.gz
PKG_BUILD_FILE_TMP=${PKG_BUILD_FILE}.tmp

get(){
  #curl http://pjp.dgplug.org/ndjbdns/${PKG_FILE} > "$rundir"/${PKG_FILE}.tmp
  wget -O "$rundir"/${PKG_FILE}.tmp http://pjp.dgplug.org/ndjbdns/${PKG_FILE}
  mv ${PKG_FILE}.tmp ${PKG_FILE}
}


build_build(){
  docker build -f Dockerfile.build -t "$SCOPE/$NAME-build" .
  # remove GZIP mod time header so checksums are consistant
  docker run -e 'GZIP=-n' "$SCOPE/$NAME-build" tar -cvpzf - "/${NAME}" > "${PKG_BUILD_FILE_TMP}"
  mv "${PKG_BUILD_FILE_TMP}" "${PKG_BUILD_FILE}"
}

build_app(){
  docker build -f Dockerfile.app -t "$SCOPE/$NAME-app" .
}

build_dnscache(){
  docker build -f dnscache/Dockerfile -t "$SCOPE/$NAME-dnscache" .
}

build_tinydns(){
  docker build -f tinydns/Dockerfile -t "$SCOPE/$NAME-tinydns" .
}

build(){
  build_build
  build_app
  build_dnscache
  build_tinydns
}


ARG=${1:-build}
$ARG

