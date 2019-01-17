FROM php:7.2.11-apache
RUN apt-get update && \
    apt-get install -y \
      git \
      libpq-dev \
      mysql-client \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
      libmcrypt-dev \
      libpng-dev \
      libwebp-dev \
      vim \
      zip \
      libxpm-dev \
      libjpeg-dev \
      librecode-dev \
      libgmp3-dev \
  && docker-php-ext-configure gd \
    --with-freetype-dir=/usr/lib/x86_64-linux-gnu/ \
    --with-jpeg-dir=/usr/lib/x86_64-linux-gnu/ \
    --with-webp-dir=/usr/lib/x86_64-linux-gnu/ \
    --with-png-dir=/usr/lib/x86_64-linux-gnu/ \
    --with-vpx-dir=/usr/lib/x86_64-linux-gnu/ \
    --with-xpm-dir=/usr/lib/x86_64-linux-gnu/ \
    --with-vpx-dir=/usr/lib/x86_64-linux-gnu/ \
  && docker-php-ext-install gd \ 
  && docker-php-ext-install mysqli pdo pdo_mysql \
  && docker-php-ext-install bcmath mbstring \
  && a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

WORKDIR /var/www
