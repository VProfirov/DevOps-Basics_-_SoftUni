FROM ubuntu:latest
LABEL maintainer="vas"
RUN apt update -y && apt install nginx && apt clean
ENTRYPOINT ["/usr/sbin/nginx","-D","daemon off;"]
EXPOSE 80 
