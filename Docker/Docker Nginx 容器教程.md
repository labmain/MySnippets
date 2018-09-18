http://www.ruanyifeng.com/blog/2018/02/nginx-docker.html



```bash
docker container run \
-d \
-p 127.0.0.2:8080:80 \
--rm \
--name mynginx \
--volume "$PWD/html":/usr/share/nginx/html \
nginx
```

```bash
-d：在后台运行
-p ：容器的80端口映射到127.0.0.2:8080
--rm：容器停止运行后，自动删除容器文件
--name：容器的名字为mynginx
```

映射配置目录

```bash
$ docker container run \
  --rm \
  --name mynginx \
  --volume "$PWD/html":/usr/share/nginx/html \
  --volume "$PWD/conf":/etc/nginx \
  -p 127.0.0.2:8080:80 \
  -d \
  nginx
```
上面代码中，--volume "$PWD/conf":/etc/nginx表示把容器的配置目录/etc/nginx，映射到本地的conf子目录。

```bash
docker run \
--rm \
-d \
-p 80:80 \
--name mynginx \
--volume "$PWD/blog":/usr/share/nginx/html \
--volume "$PWD/conf":/etc/nginx \
nginx
```