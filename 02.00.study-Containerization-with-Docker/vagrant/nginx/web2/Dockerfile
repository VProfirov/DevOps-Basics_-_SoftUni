FROM ubuntu
LABEL maintainer="SU proj"
RUN apt update -y && apt install -y nginx;
RUN echo "This is NGINX-2" > REAMDE_NGINX-2.md
ENTRYPOINT ["/usr/sbin/nginx","-g","daemon off;"]
EXPOSE 80
