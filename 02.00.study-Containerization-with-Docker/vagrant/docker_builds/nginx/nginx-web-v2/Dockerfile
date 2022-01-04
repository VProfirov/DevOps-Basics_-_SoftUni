FROM ubuntu
LABEL maintainer="SU proj"
RUN apt update -y && apt install -y nginx && apt clean;
ENTRYPOINT ["/usr/sbin/nginx","-g","daemon off;"]
EXPOSE 80
