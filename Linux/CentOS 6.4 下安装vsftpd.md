#### 概述：

vsftpd是Linux下比较著名的FTP服务器，搭建FTP服务器当然首选这个。

本文介绍了在CentOS 6.4下安装vsftpd、配置虚拟用户登录FTP的过程。

#### 正文：

## 一：安装vsftpd

查看是否已经安装vsftpd

```
rpm -qa | grep vsftpd
```
如果没有，就安装，并设置开机启动


```
yum -y install vsftpd
chkconfig vsftpd on
```

## 二：基于虚拟用户的配置

所谓虚拟用户就是没有使用真实的帐户，只是通过映射到真实帐户和设置权限的目的。虚拟用户不能登录CentOS系统。

### 修改配置文件

打开`/etc/vsftpd/vsftpd.conf`，做如下配置

```
anonymous_enable=NO //设定不允许匿名访问
local_enable=YES //设定本地用户可以访问。注：如使用虚拟宿主用户，在该项目设定为NO的情况下所有虚拟用户将无法访问
chroot_list_enable=YES //使用户不能离开主目录
ascii_upload_enable=YES
ascii_download_enable=YES //设定支持ASCII模式的上传和下载功能
pam_service_name=vsftpd //PAM认证文件名。PAM将根据/etc/pam.d/vsftpd进行认证
```
以下这些是关于vsftpd虚拟用户支持的重要配置项，默认vsftpd.conf中不包含这些设定项目，需要自己手动添加

```
guest_enable=YES //设定启用虚拟用户功能
guest_username=ftp //指定虚拟用户的宿主用户，CentOS中已经有内置的ftp用户了
user_config_dir=/etc/vsftpd/vuser_conf //设定虚拟用户个人vsftp的CentOS FTP服务文件存放路径。存放虚拟用户个性的CentOS FTP服务文件(配置文件名=虚拟用户名
```
### 进行认证

首先，安装Berkeley DB工具，很多人找不到db_load的问题就是没有安装这个包。

```
yum install db4 db4-utils
```

然后，创建用户密码文本/etc/vsftpd/vuser_passwd.txt ，注意奇行是用户名，偶行是密码

```
test
123456
```

接着，生成虚拟用户认证的db文件

```
db_load -T -t hash -f /etc/vsftpd/vuser_passwd.txt /etc/vsftpd/vuser_passwd.db
```

随后，编辑认证文件/etc/pam.d/vsftpd，全部注释掉原来语句，再增加以下两句：

```
auth required pam_userdb.so db=/etc/vsftpd/vuser_passwd
account required pam_userdb.so db=/etc/vsftpd/vuser_passwd
```

最后，创建虚拟用户配置文件

```
mkdir /etc/vsftpd/vuser_conf/
vi /etc/vsftpd/vuser_conf/test  //文件名等于vuser_passwd.txt里面的账户名，否则下面设置无效
```

内容如下

```
local_root=/ftp/www  //虚拟用户根目录,根据实际情况修改
write_enable=YES  //可写
anon_umask=022 //掩码
anon_world_readable_only=NO
anon_upload_enable=YES
anon_mkdir_write_enable=YES
anon_other_write_enable=YES
```

### 设置Selinux

```
setsebool -P ftp_home_dir=1   //设置ftp可以使用home目录
sersebool -P allow_ftpd_full_access=1   //设置ftp用户可以有所有权限
```

### 设置FTP根目录权限

```
mkdir /ftp/www   //创建目录
chmod R 755 /ftp
chmod R 777 /ftp/www
```

最新的vsftpd要求对主目录不能有写的权限所以ftp为755，主目录下面的子目录再设置777权限

### 设置防火墙

打开/etc/sysconfig/iptables

在“-A INPUT –m state --state NEW –m tcp –p –dport 22 –j ACCEPT”，下添加：

```
-A INPUT -m state --state NEW -m tcp -p -dport 21 -j ACCEPT
```

然后保存，并关闭该文件，在终端内运行下面的命令，刷新防火墙配置：

```
service iptables restart
```

OK，运行“service vsftpd start”，你就可以访问你的FTP服务器了。

## 配置PASV模式

vsftpd默认没有开启PASV模式，现在FTP只能通过PORT模式连接，要开启PASV默认需要通过下面的配置

打开/etc/vsftpd/vsftpd.conf，在末尾添加

```
pasv_enable=YES   //开启PASV模式
pasv_min_port=40000   //最小端口号
pasv_max_port=40080   //最大端口号
pasv_promiscuous=YES
```

在防火墙配置内开启40000到40080端口

```
-A INPUT -m state --state NEW -m tcp -p -dport 40000:40080 -j ACCEPT

```
重启iptabls和vsftpd

```
service iptables restart
service vsftpd restart

```
现在可以使用PASV模式连接你的FTP服务器了~

------------------------------------------------------------------------------------------------------------------

2014年12月02日添加：

CentOS 7中默认使用Firewalld做防火墙，所以修改iptables后，在重启系统后，根本不管用。

Firewalld中添加端口方法如下：

```
firewall-cmd --zone=public --add-port=3306/tcp --permanent

firewall-cmd --reload
```
