# Dokuwiki from ubuntu JALCOBRA

FROM ubuntu:latest

MAINTAINER Jorge Acosta Bravo<Jorgi9804@gmail.com>


RUN apt-get update


RUN apt-get install -y apache2 && apt-get clean

#ENTRYPOINT ["/usr/sbin/apache2", "-k", "start"]


#ENV APACHE_RUN_USER www-data
#ENV APACHE_RUN_GROUP www-data
#ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD apachectl -D FOREGROUND

COPY . /usr/src/myapp

WORKDIR /usr/src/myapp

CMD [ "php", "./your-script.php" ]

COPY --chown=www-data:www-data dokuwiki/ /var/www/html/
