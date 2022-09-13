FROM php:8.0-apache

COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN a2enmod rewrite \
      && a2ensite 000-default

RUN apt-get -y update \
        && apt-get install -y libicu-dev git zip unzip \
        && docker-php-ext-install intl \
        && pecl install xdebug

RUN docker-php-ext-install pdo pdo_mysql mysqli

CMD apachectl -D FOREGROUND
