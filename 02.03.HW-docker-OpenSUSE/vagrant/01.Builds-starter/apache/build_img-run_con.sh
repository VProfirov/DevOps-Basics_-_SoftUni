docker image build -t apache:basic_v1 /vagrant/01.Builds-starter/apache/apache-web-v1/
docker container run -it -d -p 8083:80 --name apache_con_v1 apache:basic_v1
wget localhost:8083
cat index.html

docker image build -t apache:basic_v2 /vagrant/01.Builds-starter/apache/apache-web-v2/
docker container run -it -d -p 8084:80 --name apache_con_v2 apache:basic_v2
wget localhost:8084
cat index.html
