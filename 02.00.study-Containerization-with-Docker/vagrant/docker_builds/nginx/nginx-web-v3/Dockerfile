FROM ubuntu
LABEL maintainer="SU proj"
RUN apt update -y && apt install -y nginx;
ENTRYPOINT ["nginx","-g","daemon off;"]
EXPOSE 80
