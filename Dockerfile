FROM gsbobbyd/docker_base_php_7_0

MAINTAINER Bobby Dhillon "gs.bobby@gmail.com"
RUN apt-get update

RUN apt-get install -y --allow-unauthenticated \
    php7.0 \
    php7.0-fpm

COPY www.conf /etc/php/7.0/fpm/pool.d/www.conf

# COPY php-ini-overrides.ini /etc/php/7.0/fpm/conf.d/99-overrides.ini

RUN php -v

CMD /usr/sbin/php-fpm7.0 -F -O 2>&1 | sed -u 's,.*: \"\(.*\)$,\1,'| sed -u 's,"$,,' 1>&1

EXPOSE 9000
