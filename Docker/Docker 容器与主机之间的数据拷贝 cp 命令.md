## docker cp

用于容器与主机之间的数据拷贝

使用语法

```bash
docker cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH
```

ex:

```bash
#将主机/www/soft目录拷贝到容器centos的/www目录下。
docker cp /www/soft centos:/www/

#将主机/www/soft目录拷贝到容器centos中，目录重命名为soft。
docker cp /www/soft centos:/soft

#将容器centos的/soft目录拷贝到主机的/tmp目录中。
docker cp centos:/soft /test/
```
