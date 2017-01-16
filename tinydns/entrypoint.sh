#!/bin/sh

set -uex

cd /ndjbdns/etc/ndjbdns
/ndjbdns/bin/tinydns-data

cd /ndjbdns
exec /ndjbdns/sbin/tinydns

