#                            _ooOoo_
#                           o8888888o
#                           88" . "88
#                           (| -_- |)
#                            O\ = /O
#                        ____/`---'\____
#                      .   ' \\| |// `.
#                       / \\||| : |||// \
#                     / _||||| -:- |||||- \
#                       | | \\\ - /// | |
#                     | \_| ''\---/'' | |
#                      \ .-\__ `-` ___/-. /
#                   ___`. .' /--.--\ `. . __
#                ."" '< `.___\_<|>_/___.' >'"".
#               | | : `- \`.;`\ _ /`;.`/ - ` : | |
#                 \ \ `-. \_ __\ /__ _/ .-` / /
#         ======`-.____`-.___\_____/___.-`____.-'======
#                            `=---='
#
#         .............................................
#                  佛祖镇楼                  BUG辟易
#             佛曰:
#                  写字楼里写字间，写字间里程序员；
#                  程序人员写程序，又拿程序换酒钱。
#                  酒醒只在网上坐，酒醉还来网下眠；
#                  酒醉酒醒日复日，网上网下年复年。
#                  但愿老死电脑间，不愿鞠躬老板前；
#                  奔驰宝马贵者趣，公交自行程序员。
#                  别人笑我忒疯癫，我笑自己命太贱；
#                  不见满街漂亮妹，哪个归得程序员？


# 选择一个已有的os镜像作为基础
FROM lxz1104/lnmp_centos
ENV container docker

# 镜像的作者
MAINTAINER samchenxx <chenxixian@gmail.com>


ADD default.conf /etc/nginx/conf.d/

#安装imgurl
RUN yum install -y git wget nano ImageMagick ImageMagick-devel gcc gcc-c++ autoconf automake lsof
RUN git clone https://github.com/helloxz/imgurl.git
WORKDIR /usr/share/nginx/html
RUN mkdir bak
RUN mv *.html bak/
RUN mv *.php bak/
RUN cp -r /imgurl/* .
RUN chmod 777 data
RUN chmod 777 imgs

WORKDIR /

RUN wget http://pecl.php.net/get/imagick-3.4.4.tgz
RUN tar -xzvf imagick-3.4.4.tgz
WORKDIR imagick-3.4.4
RUN phpize
RUN ./configure --with-php-config=/usr/bin/php-config --with-imagick=/usr/local/imagemagick
RUN make && make install
RUN echo "extension=imagick.so" > /etc/php.d/imagick.ini

ADD www.sh /
WORKDIR /
RUN chmod +x www.sh


#http/https端口
EXPOSE 80

ENTRYPOINT ["bash","-c","sh /www.sh"]
