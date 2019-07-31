FROM ubuntu:18.04
MAINTAINER CP@GMAIL.COM

#install packages
RUN apt-get -y update
# to set timezone
RUN apt-get -y install tzdata
ENV TZ=Asia/Kolkata

#copy all the files to opt
ADD config /opt
RUN apt-get -y install `cat /opt/nginxphp`
RUN apt-get -y install `cat /opt/phpgenericmod`
RUN apt-get -y install `cat /opt/phpprojectmod`

#RUN yum -y install php php-gd php-mysql --moved 
ADD code /var/www/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
#