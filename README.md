# php-web

PHP环境Dockerfile，可运行在任何环境，使用apt包国内源加速，快速构建完成

内包含了常用的PHP扩展，可直接用于日常项目中，如觉得臃肿的，可自行优化

镜像包含 `composer` ,  `nginx` ,  `git` ,  `npm` ,  `supervisor` ，以及PHP常用扩展 `Redis` 、 `MongoDB` 、 `Swoole`



### PHP版本：

7.4



### PHP扩展：

```shell
bcmath
Core
ctype
curl
date
dom
fileinfo
filter
ftp
gd
hash
iconv
json
libxml
mbstring
mongodb
mysqli
mysqlnd
openssl
pcntl
pcre
PDO
pdo_mysql
pdo_sqlite
Phar
posix
readline
redis
Reflection
session
SimpleXML
sockets
sodium
SPL
sqlite3
standard
swoole
tokenizer
xml
xmlreader
xmlwriter
Zend OPcache
zip
zlib
```



### 自定义构建 Docker 镜像

```shell
# Git Clone
git clone https://github.com/cqcqs/php-web

cd php-web

# 自定义Docker镜像，根据自己的需求修改Dockerfile
vim Dockerfile

# Docker Build
docker build -t php-web:1.0 .
```



### Docker 仓库

```shell
# 官方源
docker pull mhzuhe/php-web

# 阿里云加速（推荐）
docker pull registry.cn-hangzhou.aliyuncs.com/cqcqs/php-web
```



### 运行 Docker 容器

```shell
docker run --name php-web -d -p 80:80 \
-v /var/www/test/:/var/www/html \
-v /var/www/test/nginx.conf:/etc/nginx/sites-enabled/default \
mhzuhe/php-web
```



### 链接

**Blog：**[https://www.stephen520.cn/](作者博客)

**Docker：**https://hub.docker.com/r/mhzuhe/php-web