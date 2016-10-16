FROM ubuntu:latest

MAINTAINER Bobby Dhillon "gs.bobby@gmail.com"

RUN apt-get update
RUN apt-get install -y software-properties-common

RUN PPAPHP7=" ppa:ondrej/php" && \
    export LC_ALL=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    add-apt-repository $PPAPHP7

RUN apt-get update

RUN apt-get install -y --allow-unauthenticated \
    php7.0 \
    php7.0-cgi \
    php7.0-fpm \
    php7.0-cli \
    php7.0-xsl \
    php7.0-common \
    php7.0-json \
    php7.0-opcache \
    php7.0-mysql \
    php7.0-phpdbg \
    php7.0-intl \
    php7.0-gd \
    php7.0-imap \
    php7.0-ldap \
    php7.0-pgsql \
    php7.0-pspell \
    php7.0-recode \
    php7.0-snmp \
    php7.0-tidy \
    php7.0-dev \
    php7.0-curl \
    php7.0-xdebug

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y install  php7.0-memcached php7.0-mongodb php7.0-mysql php7.0-pgsql php7.0-redis php7.0-sqlite3 php7.0-bz2 php7.0-dbg php7.0-enchant php7.0-gd php7.0-geoip php7.0-gmp php7.0-igbinary php7.0-imagick php7.0-imap php7.0-intl php7.0-ldap php7.0-mbstring php7.0-msgpack php7.0-odbc php7.0-phpdbg php7.0-pspell php7.0-recode php7.0-snmp php7.0-soap php7.0-ssh2 php7.0-sybase php7.0-tidy php7.0-xdebug php7.0-xmlrpc php7.0-xsl \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN service php7.0-fpm restart

EXPOSE 9000

WORKDIR "/var/www/uvs"
