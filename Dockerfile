FROM resin/raspberry-pi-alpine-node

ENV SQUID_VERSION=3.3.8 \
    SQUID_CACHE_DIR=/var/spool/squid3 \
    SQUID_LOG_DIR=/var/log/squid3 \
    SQUID_USER=proxy

RUN apk update \
    && apk upgrade \ 
    && apk add bash squid \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /var/log/squid3

COPY squid.conf /etc/squid3/squid.conf
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 3128/tcp
VOLUME ["${SQUID_CACHE_DIR}"]
ENTRYPOINT ["/sbin/entrypoint.sh"]
