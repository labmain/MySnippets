## docker tag

标记本地镜像，将其归入某一仓库

## 使用语法

`docker tag [OPTIONS] IMAGE[:TAG] [REGISTRYHOST/][USERNAME/]NAME[:TAG]`

## ex:

```bash
#将镜像ubuntu:15.10标记为 zhaoheqiang/ubuntu:v5 镜像
docker tag ubuntu:15.10 zhaoheqiang/ubuntu:v5
```
