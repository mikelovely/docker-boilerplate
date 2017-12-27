FROM alpine:3.6

RUN apk add --no-cache \
    nginx \
    php7 \
    php7-dom \
    php7-fpm \
    php7-ctype \
    php7-curl \
    php7-json \
    php7-mbstring \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-pdo_sqlite \
    php7-redis \
    php7-sockets \
    php7-sqlite3 \
    php7-xdebug \
    php7-zlib \
    runit

RUN mkdir -p /opt/app
RUN chown nginx:nginx /opt/app
RUN mkdir -p /run/php
RUN chown nginx:nginx /run/php

COPY ./ops/etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./ops/etc/nginx/site.conf /etc/nginx/conf.d/default.conf
COPY ./ops/etc/php-fpm-www-pool.conf /etc/php7/php-fpm.d/www.conf
COPY ./ops/etc/service/nginx/run /etc/service/nginx/run
COPY ./ops/etc/service/php-fpm/run /etc/service/php-fpm/run

COPY ./ops/bin/runsvdir-start /usr/local/sbin/runsvdir-start

ENTRYPOINT ["/usr/local/sbin/runsvdir-start"]
