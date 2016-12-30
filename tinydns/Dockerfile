from deployable/ndjbdns:latest

copy tinydns/data /ndjbdns/etc/ndjbdns/
copy tinydns/ip /ndjbdns/etc/ndjbdns/
copy tinydns/tinydns.conf /ndjbdns/etc/ndjbdns/

run set -uex; \
    cd /ndjbdns/etc/ndjbdns; \
    /ndjbdns/bin/tinydns-data

copy tinydns/entrypoint.sh /ndjbdns/bin/entrypoint.sh
entrypoint ["/ndjbdns/bin/entrypoint.sh"]
cmd ["tinydns"]

