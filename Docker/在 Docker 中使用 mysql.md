## 下载 mysql 镜像

`docker pull mysql`

启动 mysql 镜像
执行如下命令，可以启动一个 mysql 容器

```bash
docker run \
-d \
-p 3306:3306 \
--name mysql \
-v /home/mysql:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD="password" \
mysql:latest
```

## 参数说明

`-d`(Detached)表示容器将以后台模式运行，所有I/O数据只能通过网络资源或者共享卷组来进行交互。

`-p 127.0.0.1:3306:3306`将主机（127.0.0.1）的端口 3306 映射到容器的端口 3306 中。这样访问主机中的 3306 端口就等于访问容器中的 3306 端口。

`--name mysql`给容器取名为 mysql，这样方便记忆。

`-v /Users/BeyondVincent/docker/mysql/data:/var/lib/mysql` 将本机的文件目录挂载到容器对应的目录（/var/lib/mysql）中。这样可以通过数据卷实现容器中数据的持久化。

`-e MYSQL_ROOT_PASSWORD="111111"`-e 表示设置环境变量，此处设置了 mysql root 用户的初始密码为 111111。

`mysql:latest`表示使用 mysql 为 latest 启动一个容器。

