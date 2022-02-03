FROM ubuntu
LABEL maintainer="su proj"
ENV TZ="Europe/Sofia"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update -y && apt install -y apache2 && apt clean
ENTRYPOINT ["apache2ctl","-D","FOREGROUND"]
EXPOSE 80