## docker ps [options]

```
options参数说明：
-a :显示所有的容器，包括未运行的。
-f :根据条件过滤显示的内容。
--format :指定返回值的模板文件。
-l :显示最近创建的容器。
-n :列出最近创建的n个容器。
--no-trunc :不截断输出。
-q :静默模式，只显示容器编号。
-s :显示总的文件大小。
```

`docker ps`命令可以查看容器的`CONTAINER ID`、`NAME`、`IMAGE NAME`、端口开启及绑定、容器启动后执行的`COMMNAD`。经常通过`ps`来找到`CONTAINER_ID`。
`docker ps` 默认显示当前正在运行中的container
`docker ps -a` 查看包括已经停止的所有容器
`docker ps -l` 显示最新启动的一个容器（包括已停止的）

## 实例

```bash
#列出所有正在运行的容器
docker ps
#列出所有容器
docker ps -a
#根据容器的Status过滤
docker ps -f STATUS=created
#列出最近创建的3个容器
docker ps -n 3
```