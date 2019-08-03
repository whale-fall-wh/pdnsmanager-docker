FROM php:apache

LABEL maintainer="maoxuner@126.com"

RUN set -ex \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && a2enmod rewrite alias

ENV PDNSMANAGER_VERSION 2.0.1
ENV PDNSMANAGER_SOURCE https://dl.pdnsmanager.org/pdnsmanager-${PDNSMANAGER_VERSION}.tar.gz
RUN set -ex \
    && curl ${PDNSMANAGER_SOURCE} | tar xz --strip-components=1 \
    && chown -R www-data:www-data /var/www/html/*

COPY pdnsmanager.conf /etc/apache2/sites-available/pdnsmanager.conf
RUN set -ex \
    && rm -rf /etc/apache2/sites-enabled/* \
    && ln -s /etc/apache2/sites-available/pdnsmanager.conf /etc/apache2/sites-enabled/pdnsmanager.conf

COPY start.sh /usr/local/bin/start.sh
CMD ["/usr/local/bin/start.sh"]
