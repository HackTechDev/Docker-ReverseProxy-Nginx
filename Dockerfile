FROM php:7.4-apache

RUN docker-php-ext-install pdo pdo_mysql
RUN apt-get update && apt-get install -y vim screen mc imagemagick libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libxpm-dev zlib1g-dev libgd-dev

RUN docker-php-ext-configure gd --with-freetype=/usr --with-jpeg=/usr
RUN docker-php-ext-install gd

RUN service apache2 restart

RUN a2enmod rewrite
