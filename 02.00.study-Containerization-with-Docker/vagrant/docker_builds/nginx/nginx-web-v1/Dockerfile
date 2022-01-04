FROM ubuntu
LABEL maintainer="SU proj"
RUN apt update -y && apt install -y nginx;
RUN echo "This is NGINX-1" > README_nginx1.md
ENTRYPOINT ["/usr/sbin/nginx","-g","daemon off;"]
EXPOSE 80
