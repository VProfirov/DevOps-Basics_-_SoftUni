FROM ubuntu:latest
LABEL maintainer="su proj"
ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y && apt install -y apache2 && apt clean
ENTRYPOINT ["apache2ctl","-D","FOREGROUND"]
EXPOSE 80
