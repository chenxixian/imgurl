git clone https://github.com/helloxz/imgurl.git
cd imgurl
docker build -t helloxz/imgurl:2.0 .
docker save -o  helloxz-imgurl.tar helloxz/imgurl:2.0
