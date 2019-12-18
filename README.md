# php-web
PHP环境Dockerfile，包含 `php7.2` , `composer` , `nginx` , `git`

https://stephen520.cn/blog/10242

```shell
docker run --name web -d -p 80:80 \
-v /var/www/test/:/var/www/html \
-v /var/www/test/nginx.conf:/etc/nginx/nginx.conf \
mhzuhe/php-web:1.0
```
