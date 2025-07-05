FROM php:8.2-apache

RUN a2enmod ssl && a2enmod rewrite
RUN mkdir -p /etc/apache2/ssl

COPY ./ssl/*.pem /etc/apache2/ssl/
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./src /var/www/html/

EXPOSE 443
