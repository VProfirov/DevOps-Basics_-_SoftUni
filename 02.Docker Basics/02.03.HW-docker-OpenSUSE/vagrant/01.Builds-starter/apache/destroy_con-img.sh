docker container stop apache_con_v1
docker container rm apache_con_v1
docker image rm apache:basic_v1
rm index.html

docker container stop apache_con_v2
docker container rm apache_con_v2
docker image rm apache:basic_v2
rm index.html.1
