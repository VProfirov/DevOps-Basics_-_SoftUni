FROM ubuntu
LABEL maintainer="su proj"
RUN apt update -y
COPY --chown=games:games README-external.md /home
ADD --chown=games:games sometar.tar /home
ADD https://maxcdn.icons8.com/Share/icon/Logos/duckduckgo1600.png /home/favicon.co
ADD sometar.tar /home/sometar2.tar
EXPOSE 8080 8081 80
