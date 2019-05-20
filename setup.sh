docker load -i helloxz-imgurl.tar
git clone https://github.com/helloxz/imgurl.git
cd imgurl
chmod 777 data
chmod 777 imgs

sed -i 's/build: ./# build: ./g'  docker-compose.yml
#Mac: 注释上一句，取消注释下一句
#sed -i '' 's/build: ./# build: ./g'  docker-compose.yml

sed -i 's/8080:80/80:80/g'  docker-compose.yml
#Mac: 注释上一句，取消注释下一句
#sed -i '' 's/8080:80/80:80/g'  docker-compose.yml

docker-compose up -d