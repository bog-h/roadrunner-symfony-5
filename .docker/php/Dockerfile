# Dockerfile
FROM php:7.4-alpine as base
RUN apk add --no-cache autoconf openssl-dev g++ make pcre-dev icu-dev zlib-dev libzip-dev && \
    docker-php-ext-install bcmath intl opcache zip sockets && \
    apk del --purge autoconf g++ make
RUN set -ex \
	&& apk --no-cache add postgresql-libs postgresql-dev \
	&& docker-php-ext-install pgsql pdo_pgsql \
	&& apk del postgresql-dev

WORKDIR /usr/src/app

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

EXPOSE 8080
EXPOSE 6001

FROM base as debug
RUN apk --update --no-cache add autoconf g++ make && \
    pecl install -f xdebug-2.9.4 && \
    docker-php-ext-enable xdebug && \
    apk del --purge autoconf g++ make
COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini