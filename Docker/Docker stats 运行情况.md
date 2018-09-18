## 使用命令

```
docker stats [OPTIONS] [CONTAINER...]
```

`docker stats`命令返回一个用于运行容器的实时数据流。
要将数据限制到一个或多个特定的容器，可以指定一个由空格分隔的容器名称或ID的列表。
您也可以指定一个已停止的容器，但是停止的容器不返回任何数据

显示多个容器的运行信息
`docker stats dockername1 dockername2`
容器名之间用空格隔开

## 扩展参数
OPTIONS	默认	说明
–all, -a	false	显示所有容器（默认显示刚刚运行）
–format		使用Go模板打印图像
–no-stream	false	禁用流统计信息，仅拉取第一个结果