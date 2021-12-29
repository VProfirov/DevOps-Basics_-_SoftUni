FROM ubuntu
LABEL maintainer="vas"
RUN apt update -y && apt install -y apache2 && apt clean && apt
EXPOSE 80
CMD ["apache2ctl","-D","FOREGROUND"]