FROM ubuntu
LABEL maintainer="vas"
RUN apt update -y && apt install -y nginx && apt clean
ENTRYPOINT ["nginx","-g","daemon off;"]
EXPOSE 80
