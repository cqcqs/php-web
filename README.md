# php-web
Dockerfile

docker run --name web -d -p 80:80 /var/www/test/:/var/www/html -v /var/www/test/nginx.conf:/etc/nginx/nginx.conf php-web:1.0
