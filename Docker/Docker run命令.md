## docker run

创建一个新的容器并运行一个命令

```bash
docker run [options] image [command] [arguments]

options参数说明：
-a stdin: 指定标准输入输出内容类型，可选 STDIN/STDOUT/STDERR 三项；
-d: 后台运行容器，并返回容器ID；
-i: 以交互模式运行容器，通常与 -t 同时使用；
-t: 为容器重新分配一个伪输入终端，通常与 -i 同时使用；
--name="hadoop01": 为容器指定一个名称；
--dns 8.8.8.8: 指定容器使用的DNS服务器，默认和宿主一致；
--dns-search example.com: 指定容器DNS搜索域名，默认和宿主一致；
-h "zhq": 指定容器的hostname；
-e username="zhaoheqiang": 设置环境变量；
--env-file=[]: 从指定文件读入环境变量；
--cpuset="0-2" or --cpuset="0,1,2": 绑定容器到指定CPU运行；
-m :设置容器使用内存最大值；
-net="bridge": 指定容器的网络连接类型，支持 bridge/host/none/container: 四种类型；
--link=[]: 添加链接到另一个容器；
--expose=[]: 开放一个端口或一组端口；
-p 将容器的端口映射到主机的某个端口
-P 将容器的80端口映射到主机的任意一个端口
-v 指定主机某目录映射到容器某个目录
```

## 实例

```bash
#使用docker镜像nginx:latest以后台模式启动一个容器,并将容器命名为ruby_nginx。
docker run --name ruby_nginx -d ruby:latest

#使用镜像nginx:latest以后台模式启动一个容器,并将容器的80端口映射到主机随机端口。
docker run -P -d nginx:latest

#使用镜像nginx:latest以后台模式启动一个容器,将容器的80端口映射到主机的80端口,主机的目录/data映射到容器的/data。
docker run -p 80:80 -v /data:/data -d nginx:latest

#使用镜像nginx:latest以交互模式启动一个容器,在容器内执行/bin/bash命令。
docker run -it nginx:latest /bin/bash
```