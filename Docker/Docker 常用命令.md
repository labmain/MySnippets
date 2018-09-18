## List Docker CLI commands
docker
docker container --help

## Display Docker version and info
docker --version
docker version
docker info

## 登陆Docker

```bash
$ docker login
```

## 获取镜像

通过`docker search 【关键词】`命令获知镜像名称后，
我们就可以用`docker pull 【镜像名称】`命令下载此镜像了，

如下所示：
```bash
[root@localhost ~]# docker pull redis
latest: Pulling from redis
f33a13616df9: Pull complete
c8f952ba8693: Pull complete
f0bdf40cb834: Pull complete
......
Digest: sha256:9c5c3201c43bbc7cb740df1deafea99354da57bf80cb81cdf5fa13d7c6a5adf5
Status: Downloaded newer image for redis:latest
```

这样下载是的最新稳定版的镜像。

如果要指定版本，可以在镜像名后加 :版本名，如：
`docker pull tomcat:8.0`


## 创建运行容器

有了镜像后，我们可以用镜像运行一个dock容器了。

下面以 `redis` 为例，介绍两种运行方式：

### 第1种方式，以交互的方式运行，如：
`docker run -it -p 6379:6379 --name redis-serv-1 redis /bin/bash`
```bash
-p 表示指定端口映射， 6379:6379 表示映射到外面接受访问的是6379端口，在容器里用的也是6379端口。
-it 表示以交互的方式启动容器，启动后会直接进入到容器上，可以在容器中操作，比如执行命令 /usr/local/bin/redis-server & 以启动 redis 服务。
操作完后连续按 ctrl+p, ctrl+q 可以退出容器（注意：不能用exit退出，会让容器结束运行）。
```

后续可以用attach命令再连接上容器上操作：

`docker attach 【容器ID】 `

### 第2种方式，以后台的方式运行，但不能attach上去操作，如：
```bash
[root@localhost ~]# docker run -d -p 6379:6379 --name redis-serv redis /bin/bash -c "/usr/local/bin/redis-server"
9cd2912e118c339cb29bb14ef30fc55b69884c15aacb5d3d60cb2db7d4544c77
```

```bash
-d 在后台运行，不能attach上去操作。
-c 指定容器启动时，执行的命令。
```

命令出输出这个容器实例的id，后续操作这个容器会用到。


## 查看容器状态

查看 docker 服务本身的状态：
`docker info`
查看有哪些 docker 容器正在运行：
`docker ps`
或加上 `-a` 以查看全部：
`docker ps -a`

## 管理容器

通过 `docker -ps -a` 查看，可以看到每个容器的的 ID，如：

```bash
[root@localhost ~]# docker ps -a
CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS                    NAMES
9cd2912e118c        redis               "docker-entrypoint.s   2 hours ago         Up 2 hours          0.0.0.0:6379->6379/tcp   redis-serv
```

用这个 CONTAINER ID 就可以操作容器，如：

`docker stop 9cd2912e118c` 停止这个容器。
`docker start 9cd2912e118c` 启动这个容器。
`docker rm 9cd2912e118c` 删除这个容器，注意只能先停止再删除。
