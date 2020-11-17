FROM centos:latest




RUN yum install httpd -y
RUN yum install sudo -y

WORKDIR /code

COPY index.html /var/www/html

EXPOSE 80

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

