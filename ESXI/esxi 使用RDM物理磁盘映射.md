## 使用RDM物理磁盘映射

将硬盘接入ESXI中，但不要添加为存储器（如果添加，则会进行格式化，会清除数据！）


1. 获取添加的硬盘标识符 
```
ls -l /dev/disks #查看当前挂载的所有磁盘信息。
```
2. ssh登陆ESXI中，执行以下命令
```
vmkfstools -z /vmfs/devices/disks/硬盘标识符 /vmfs/volumes/datastore1/任意命名.vmdk
ls /vmfs/volumes/datastore1   #查看是否存在vmdk文件
```
如果一切正常，则可在虚拟机中挂载已有硬盘直接使用 

然后重启虚拟机，直接使用硬盘即可！