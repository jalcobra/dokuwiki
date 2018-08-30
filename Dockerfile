# Dokuwiki from ubuntu JALCOBRA

FROM ubuntu:16.04

MAINTAINER Jorge Acosta Bravo<Jorgi9804@gmail.com>

RUN apt-get update 

# se instala el php y apache  

RUN apt-get -y install wget
RUN apt-get -y install php7.0
RUN apt-get -y install php-mbstring
RUN apt-get -y install php7.0-xml
RUN apt-get -y install apache2 libapache2-mod-php php-xml


RUN cd /var/www
RUN wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
RUN tar xvf dokuwiki-stable.tgz
RUN mv dokuwiki-*/* /var/www/html
RUN chown -R www-data:www-data /var/www/html/
RUN rm  /var/www/html/index.html
RUN a2enmod rewrite
RUN service apache2 restart

EXPOSE 80

CMD /usr/sbin/apache2ctl -D FOREGROUND 