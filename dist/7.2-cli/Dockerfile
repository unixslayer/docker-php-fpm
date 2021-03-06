ARG http_proxy=""
ARG https_proxy=""

FROM php:7.2-cli

MAINTAINER Piotr Zając <piotr.zajac@unixslayer.pl>

RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

RUN pear config-set http_proxy ${http_proxy}

RUN apt-get update -y && \
    apt-get install -y \
    ca-certificates \
    git \
    cron \
    wget \
    unzip \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libxslt1-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libxslt1-dev \
    libjpeg-dev \
  && pecl install mcrypt-1.0.1 \
  && apt-get clean

RUN docker-php-ext-configure \
  gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install \
  bcmath \
  gd \
  intl \
  mbstring \
  soap \
  xsl \
  zip \
  opcache

RUN docker-php-ext-enable mcrypt

ENV PHP_MEMORY_LIMIT="4G" \
http_proxy=${http_proxy} \
https_proxy=${https_proxy}

RUN chown -R www-data:www-data /var/www

COPY ./conf /conf/
COPY ./bin/init.sh /usr/local/bin/init.sh

RUN ["chmod", "+x", "/usr/local/bin/init.sh"]
RUN ["/usr/local/bin/init.sh"]

WORKDIR /var/www/html

CMD ["php"]
