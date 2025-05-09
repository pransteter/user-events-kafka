FROM php:8.4-fpm-alpine

COPY . /var/www/project

WORKDIR /var/www/project

RUN apk update && apk upgrade \
    && apk add --no-cache bash git \
    && chmod +x ./install_composer.sh \
    && ./install_composer.sh \
    && mv ./composer.phar /usr/bin/composer \
    && composer install \
    && curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash \
    && apk add --no-cache symfony-cli
