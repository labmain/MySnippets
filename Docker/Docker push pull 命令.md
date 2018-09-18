## docker pull

从镜像仓库中拉取或者更新指定镜像

使用语法

```bash
docker pull [options] name[:tag]
options参数说明：
-a :下载所有已经打过标签的镜像
--disable-content-trust :忽略镜像的校验,默认开启
```

ex:

```bash
#获取java最新版镜像。
docker pull java

#获取java的所有镜像。
docker pull -a java
```

## docker push

将本地的镜像上传到镜像仓库,要先登陆到镜像仓库

使用语法

```bash
docker push [options] name[:tag]
options参数说明：
--disable-content-trust :忽略镜像的校验,默认开启
```

ex:

```bash
#上传javaweb环境1.0.1镜像到远程镜像库
docker push javaWeb:1.0.1
```