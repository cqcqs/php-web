FROM php:7.2-fpm

MAINTAINER Stephen "admin@stephen520.com"

RUN sed -i "s@http://deb.debian.org@http://mirrors.aliyun.com@g" /etc/apt/sources.list && \
    rm -Rf /var/lib/apt/lists/* && \
    apt-get update && \
    apt-get install -y curl telnet git zlib1g-dev && \
    /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' > /etc/timezone && \
    docker-php-ext-install zip pdo pdo_mysql opcache mysqli && \
    apt-get install -y nginx supervisor && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');" && \
    pecl install redis mongodb swoole && \
    rm -rf /tmp/pear && \
    docker-php-ext-enable redis mongodb swoole && \
    apt-get clean && rm -rf /var/cache/apt/*

COPY ./supervisord.conf /etc/supervisor/

WORKDIR /var/www/html

EXPOSE 80

CMD ["/usr/bin/supervisord"]

