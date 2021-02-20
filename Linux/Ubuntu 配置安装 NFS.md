## 安装
```
sudo apt-get install nfs-kernel-server
```
## 配置

sudo vim /etc/exports

在文件的末尾添加
```
/mnt *(rw,sync,no_root_squash,insecure)
```

mnt代表的是共享的目录
代表是允许所有的网络访问
ro 该主机对该共享目录有只读权限
rw 该主机对该共享目录有读写权限
root_squash 客户机用root用户访问该共享文件夹时，将root用户映射成匿名用户
no_root_squash 客户机用root访问该共享文件夹时，不映射root用户
all_squash 客户机上的任何用户访问该共享目录时都映射成匿名用户anonuid 将客户机上的用户映射成指定的本地用户ID的用户
anongid 将客户机上的用户映射成属于指定的本地用户组ID
sync 资料同步写入到内存与硬盘中
async 资料会先暂存于内存中，而非直接写入硬盘insecure 允许从这台机器过来的非授权访问
允许客户端从大于1024的tcp/ip端口连接服务器

## 重启NFS服务
```
/etc/init.d/rpcbind restart
/etc/init.d/nfs-kernel-server restart
```

## 客户端验证
```
showmount -e 47.94.131.201
```
输入上面命令，出现下面结果，代表nfs服务端配置完成
```
$ showmount -e 10.0.0.12
Exports list on 10.0.0.12:
/media/shun/PT/downloads            *
```


https://www.cnblogs.com/gsqc/p/10885939.html
