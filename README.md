# imgurl for Docker

## 自建版本(基于Centos7的LNMP环境 软件版本 nginx:latest mysql:5.7 php:7.2)

### 镜像构建

```
git clone https://ecs.chenxixian.cn/chenxixian/imgurl.git
cd imgurl
docker build -t samchenxx/imgurl:1.0.0 .
```

### 容器运行

```
docker run --restart=always --name imgurl --privileged -dti -p 80:80 samchenxx/imgurl:1.0.0
```

### 镜像打包(为了离线安装)

```
docker save -o samchenxx-imgurl.tar samchenxx/imgurl:1.0.0
```

### 镜像加载(为了离线安装)

```
docker load -i samchenxx-imgurl.tar 
```

## 官方版本(Apache/2.4.10 (Debian) PHP/7.1.29)


### 镜像构建和打包(为了离线安装)

```
git clone https://ecs.chenxixian.cn/chenxixian/imgurl.git
cd imgurl
./build.sh
```

### 容器运行

如果紧接上一步，可以直接执行；

如果需要离线安装，先把上一步打包好的文件（helloxz-imgurl.tar）scp到服务器imgurl路径（git clone https://ecs.chenxixian.cn/chenxixian/imgurl.git 克隆项目的路径），再执行：

```
./setup.sh
```




