# 简介

LNMP是Linux、Nginx、MySQL和PHP的缩写，这个组合是最常见的WEB服务器的运行环境之一。本文将带领大家在CentOS 6操作系统上搭建一套LNMP环境。

本教程适用于CentOS 6.x版本。

在安装LNMP环境之前，您需要先对CentOS操作系统做一些初始化的工作，可以参考[CentOS系统初始化设置](https://mos.meituan.com/library/initial-setup-with-centos)。

* * *

# 安装Nginx

美团云的CentOS系统模板中配置了内网源，下载速度较快，推荐使用`yum`安装Nginx：

```
sudo yum install nginx

```

按照提示，输入`yes`后开始安装。安装完毕后，Nginx的配置文件在`/etc/nginx`目录下。使用以下命令启动Nginx：

```
sudo service nginx start

```

您可以通过浏览器访问 `http://<外网IP地址>` 来确定Nginx是否已经启动。

最后我们通过`chkconfig`命令将Nginx设置为开机启动：

```
sudo chkconfig nginx on

```

* * *

# 安装MySQL

我们可以使用`yum`直接安装MySQL：

```
sudo yum install mysql-server

```

安装完成之后，执行以下命令重启MySQL服务：

```
sudo service mysqld restart

```

重启过程中会提示如何设置MySQL的root密码，我们按照提示进行操作：

```
sudo /usr/bin/mysql_secure_installation

```

这个脚本会经过一些列的交互问答来进行MySQL的安全设置。

首先提示输入当前的root密码：

```
Enter current password for root (enter for none):

```

初始root密码为空，我们直接敲回车进行下一步。

```
Set root password? [Y/n]

```

设置root密码，默认选项为`Yes`，我们直接回车，提示输入密码，在这里设置您的MySQL的root账户密码。

```
Remove anonymous users? [Y/n]

```

是否移除匿名用户，默认选项为`Yes`，建议按默认设置，回车继续。

```
Disallow root login remotely? [Y/n]

```

是否禁止root用户远程登录？如果您只在本机内访问MySQL，建议按默认设置，回车继续。 如果您还有其他云主机需要使用root账号访问该数据库，则需要选择`n`。

```
Remove test database and access to it? [Y/n]

```

是否删除测试用的数据库和权限？ 建议按照默认设置，回车继续。

```
Reload privilege tables now? [Y/n]

```

是否重新加载权限表？因为我们上面更新了root的密码，这里需要重新加载，回车。

完成后你会看到`Success!`的提示，MySQL的安全设置已经完成。我们可以使用以下命令登录MySQL：

```
mysql -uroot -p

```

按提示输入root密码，就会进入MySQL的交互界面，说明已经安装成功。

MySQL安装完成后默认监听外网的3306端口，有一定的安全隐患，我们通过编辑MySQL的配置文件，将MySQL服务修改为监听内网的3306端口，这样就不会被外界探测到，编辑`/etc/my.cnf`文件，在`[mysqld]`中增加一行：

```
bind-address=10.128.129.21

```

需要将上面的`10.128.129.21`替换成您的云主机的内网地址。内网地址可以从MOS控制台云主机列表中找到。然后重启MySQL服务使配置生效：

```
sudo service mysqld restart

```

最后我们使用`chkconfig`命令将MySQL设置为开机启动。

```
sudo chkconfig mysqld on

```

* * *

# 安装PHP

我们可以直接使用`yum`安装PHP：

```
sudo yum install php-fpm php-mysql

```

安装完成后我们将php-fpm启动：

```
sudo service php-fpm start

```

将php-fpm设置为开机启动：

```
sudo chkconfig php-fpm on

```

php安装完成之后，需要设置一下php session的目录：

```
sudo mkdir /var/lib/php/session/
sudo chown -R apache:apache /var/lib/php/session/

```

这时php-fpm已经安装完毕，但是现在需要配置一下Nginx，在`/etc/nginx/conf.d`目录中新建一个名为`php.conf`的文件，其内容为：

```
server {
    listen 8000;
    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    location ~ \.php$ {
        root           /usr/share/php;
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
        include        fastcgi_params;
    }
}

```

然后执行以下命令使我们的配置生效：

```
sudo service nginx reload

```

以上我们配置了Nginx的8000端口用来测试，如果您在美团云控制台创建机器时选择了绑定防火墙，需要检查该防火墙是否允许8000端口，如果不允许的话，您可以在[防火墙设置](http://mos.meituan.com/console/#secgroup)中新增防火墙，并关联到该主机。

我们在`/usr/share/php`目录下新建一个名为`phpinfo.php`的文件用来展示phpinfo信息，文件内容为：

```
<?php echo phpinfo(); ?>

```

我们从浏览器打开 `http://<外网IP地址>:8000/phpinfo.php`，您就能看到phpinfo信息了，说明我们php环境已经部署成功：

验证PHP安装成功后，需要将此`phpinfo.php`文件删除，线上环境尽量不要暴漏使用的软件版本及路径信息，以防被入侵者利用。

* * *

# 总结

使用美团云内置的yum源，我们可以快速的搭建起LNMP的环境，经过简单的安全设置，就可以达到线上服务部署的要求。
