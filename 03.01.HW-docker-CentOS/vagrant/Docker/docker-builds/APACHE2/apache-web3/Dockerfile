FROM ubuntu
LABEL maintainer="vas"
ENV TZ=Europe/Sofia
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update -y && apt install -y apache2 && apt clean
#fix this:
# line for the ENTRY (RM: entrypoints are check during image compile time)
ENTRYPOINT ["apache2ctl","-D","FOREGROUND"]
EXPOSE 80
