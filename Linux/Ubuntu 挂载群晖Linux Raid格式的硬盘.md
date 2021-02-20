## 输入以下命令以安装 mdadm 和 lvm2两者都是 RAID 管理工具。必须安装 lvm2，否则 vgchange 无法正常工作。
```
Ubuntu@ubuntu:~$ sudo -i
root@ubuntu:~$ sudo apt-get update 
root@ubuntu:~$ sudo apt-get install -y mdadm lvm2
```
## 运行以下命令来装载 DiskStation 的所有硬盘。
```
sudo mdadm -Asf && vgchange -ay
```