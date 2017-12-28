FROM alpine:3.6

RUN apk add --no-cache \
    nginx \
    runit

RUN mkdir -p /opt/app
RUN chown nginx:nginx /opt/app

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./site.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/run /etc/service/nginx/
COPY ./runsvdir-start /usr/local/sbin/runsvdir-start

ENTRYPOINT ["/usr/local/sbin/runsvdir-start"]
