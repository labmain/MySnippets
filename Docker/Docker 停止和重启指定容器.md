## docker start/stop/restart/pause/unpause

启动容器/停止容器/重启容器/暂停容器中所有的进程/恢复容器中所有的进程

## 语法
`docker start/stop/restart/pause/unpause [container]`


## 实例
```bash
#启动nginx容器
docker start nginx
#停止nginx容器
docker stop nginx
#重启nginx容器
docker restart nginx
#暂停数据库容器mysql提供服务。
docker pause mysql
#恢复数据库容器mysql提供服务。
docker unpause mysql
```

## 获取容器 ID

```bash
$ docker container ls
CONTAINER ID        IMAGE               COMMAND             CREATED
1fa4ab2cf395        friendlyhello       "python app.py"     28 seconds ago
```

## 停止容器

```bash
docker container stop 1fa4ab2cf395
```

## 重启容器
```bash
docker restart 1fa4ab2cf395
```