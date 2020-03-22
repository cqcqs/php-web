# php-web

PHP环境Dockerfile，使用apt包国内源加速，10分钟构建完成

镜像包含 `composer` , `nginx` , `git` ，以及PHP常用扩展 `Redis` 、 `MongoDB` 、 `Swoole`

### PHP版本：

7.2

### PHP扩展：

- Core
- ctype
- curl
- date
- dom
- fileinfo
- filter
- ftp
- hash
- iconv
- json
- libxml
- mbstring
- mongodb
- mysqli
- mysqlnd
- openssl
- pcre
- PDO
- pdo_mysql
- pdo_sqlite
- Phar
- posix
- readline
- redis
- Reflection
- session
- SimpleXML
- sodium
- SPL
- sqlite3
- standard
- swoole
- tokenizer
- xml
- xmlreader
- xmlwriter
- Zend OPcache
- zip
- zlib

### 构建Docker镜像

```shell
docker build -t web:1.0 .
```

### 运行Docker容器

```shell
docker run --name web -d -p 80:80 \
-v /var/www/test/:/var/www/html \
-v /var/www/test/nginx.conf:/etc/nginx/nginx.conf \
mhzuhe/php-web:1.0
```

### 博客

https://stephen520.cn/blog/10242
