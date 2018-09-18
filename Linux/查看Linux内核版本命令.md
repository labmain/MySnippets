## 一、查看Linux内核版本命令（两种方法）

1. `cat /proc/version`

```bash
[root@localhost ~]# cat /proc/version
Linux version 2.6.18-194.8.1.el5.centos.plus
(mockbuild@builder17.centos.org) (gcc version 4.1.220080704
(Red Hat 4.1.2-48)) #1 SMP Wed Jul 7 11:50:45 EDT 2010
```

2. `uname -a`

```bash
[root@localhost ~]# uname -a
Linux localhost.localdomain 2.6.18-194.8.1.el5.centos.plus 
#1 SMP Wed Jul 7 11:50:45 EDT 2010 i686 i686 i386 GNU/Linux
```

## 二、查看Linux系统版本的命令（3种方法）

1. `lsb_release -a`，即可列出所有版本信息：

```bash
[root@localhost ~]# lsb_release -a
LSB Version: :core-3.1-ia32:core-3.1-noarch:graphics-3.1-ia32:graphics-3.1-noarch
Distributor ID: CentOS
Description: CentOS release 6.5 (Final)
Release: 6.5
Codename: Final
```

这个命令适用于所有的Linux发行版，包括Redhat、SuSE、Debian…等发行版。

2. `cat /etc/redhat-release`，这种方法只适合Redhat系的Linux：

```bash
[root@localhost ~]# cat /etc/redhat-release
CentOS release 6.7 (Final)
```

3. `cat /etc/issue`，此命令也适用于所有的Linux发行版。

```bash
[root@localhost ~]# cat /etc/issue
CentOS release 6.7 (Final)
Kernel \r on an \m
```