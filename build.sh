git clone https://github.com/helloxz/imgurl.git
cd imgurl
docker-compose up -d
docker save -o  helloxz-imgurl.tar helloxz/imgurl:2.0
