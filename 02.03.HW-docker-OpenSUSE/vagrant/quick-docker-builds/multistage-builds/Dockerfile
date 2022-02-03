FROM ubuntu:latest AS stage_01_apache
LABEL maintainer="su proj"
ENV TZ="Europe/Sofia"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update -y && apt install -y apache2 && apt clean
ENTRYPOINT ["apache2ctl","-D","FOREGROUND"]
EXPOSE 80

FROM ubuntu:latest AS stage_02_nginx
LABEL maintainer="su 2 proj"
RUN apt update -y && apt install -y nginx && apt clean
ENTRYPOINT ["/usr/sbin/nginx","-g","daemon off;"]
EXPOSE 80
