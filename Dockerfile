FROM php:7.4-fpm

MAINTAINER Stephen "admin@stephen520.cn"

RUN sed -i "s@http://deb.debian.org@http://mirrors.aliyun.com@g" /etc/apt/sources.list && \
    rm -Rf /var/lib/apt/lists/* && \

    apt-get update && \
    apt-get install -y curl \
                       telnet \
                       git \
                       zlib1g-dev \
                       libzip-dev \
                       libpng-dev \
                       libjpeg62-turbo-dev \
                       libfreetype6-dev && \

    # Timezone
    /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo 'Asia/Shanghai' > /etc/timezone && \

    # PHP Library
    docker-php-ext-install zip \
                           pdo \
                           pdo_mysql \
                           opcache \
                           mysqli \
                           bcmath \
                           sockets \
                           pcntl && \

    apt-get install -y nginx \
                       supervisor \
                       npm && \

    # cnpm
    npm install -g cnpm --registry=https://registry.npm.taobao.org && \

    # composer
    php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');" && \
    composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ && \

    # Redis Mongo Swoole
    pecl install redis mongodb swoole && \
    rm -rf /tmp/pear && \
    docker-php-ext-enable redis mongodb swoole && \

    # GD
    docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd && \

    apt-get clean && rm -rf /var/cache/apt/*

COPY ./supervisord.conf /etc/supervisor/

WORKDIR /var/www/html

EXPOSE 80
EXPOSE 443

CMD ["/usr/bin/supervisord"]
