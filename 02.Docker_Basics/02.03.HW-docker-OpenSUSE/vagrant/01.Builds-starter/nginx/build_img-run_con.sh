docker image build -t nginx:basic /vagrant/01.Builds-starter/nginx/nginx-web-v1/
docker container run -it -d -p 8081:80 --name nginx_con_01 nginx:basic


wget localhost:8081
bat index.html
