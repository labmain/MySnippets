
## 升级内核
$ sudo apt-get update
如果内核版本较旧，则需要先更新内核，以下是更新xenial内核

$ sudo apt-get install linux-image-generic-lts-xenial
$ sudo reboot

## 使用阿里云链接安装 Docker
使用阿里云的加速器，也就是阿里云的又一个镜像
使用阿里云的开发者平台登录云服务器后台 https://dev.aliyun.com/
找到加速器地址，配置镜像的地址（直接执行命令）

## 运行laraedit

https://github.com/laraedit/laraedit-docker

//下面的命令将laraedit的80端口映射到docker-machine的80端口
//并将你定义的app目录映射到www目录下，请注意laravel项目的public目录必须得在app根目录下，不能处于二级目录

docker run -p 80:80 -v /home/data/Memes-DEMO:/var/www/html/app laraedit/laraedit
docker run --name laravel -p 80:80 -v /home/data/Memes-DEMO:/var/www/html/app laraedit/laraedit

参数说明：
--name：启动的服务名称
-p: 端口映射，本机8088端口映射容器80端口
-v: 目录挂载，本机目录：容器目录 (如果有多个目录挂载，就多个 -v)
-d: 如果加上这个参数表示后台启动服务

## mysql 信息
MySQL Username = homestead
MySQL Password = secret
MySQL Database = homestead

## 进入容器 bash
docker exec -it laravel /bin/bash

## 查看正在运行的 容器
docker ps
