FROM ubuntu
LABEL maintainer="SU Proj"
RUN apt update -y && apt install -y nginx
ENTRYPOINT ["/usr/sbin/nginx","-g","daemon off;"]
EXPOSE 80

