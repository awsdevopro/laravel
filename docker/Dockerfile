FROM php:7.2.11-apache
RUN apt-get update && \
    apt-get install -y \
      supervisor build-essential git openssh-server \
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
  && mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor \
  && echo 'root:'passwd | chpasswd \
  && sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
  && sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config \
  && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
  && docker-php-ext-install gd \ 
  && docker-php-ext-install mysqli pdo pdo_mysql \
  && docker-php-ext-install bcmath mbstring \
  && a2enmod rewrite

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

WORKDIR /var/www
CMD ["/usr/bin/supervisord"]

