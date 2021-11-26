FROM  php:7.4-fpm

# install php dependencies
RUN apt-get update && apt-get install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip \
    && docker-php-ext-install intl opcache pdo pdo_mysql \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

 

# set work dir 
WORKDIR /var/www/project

# install composer 
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# install symfony
RUN curl -sS https://get.symfony.com/cli/installer | bash

# move symfony too bin dir
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony
