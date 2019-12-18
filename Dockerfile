FROM php:7.2-fpm

MAINTAINER Stephen "mhzuhe@163.com"

RUN apt-get update && \
    apt-get install -y curl telnet git zlib1g-dev && \
    /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' > /etc/timezone && \
    docker-php-ext-install zip pdo pdo_mysql opcache mysqli && \
    apt-get install -y nginx && \
    apt-get install -y supervisor && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');" && \
    apt-get clean && rm -rf /var/cache/apt/*

COPY ./supervisord.conf /etc/supervisor/

EXPOSE 80

CMD ["/usr/bin/supervisord"]

