FROM ubuntu
LABEL maintainer="SU Proj"
ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y && apt install -y apache2
ENTRYPOINT ["apache2ctl","-D","FOREGROUND"] 
EXPOSE 80

