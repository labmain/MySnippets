WordPress是一个基于PHP的开源博客系统。它起源于2003年，是目前世界上最流行的开源博客系统。

本教程适用于CentOS 6版本。

在安装WordPress之前，您需要先对CentOS操作系统做一些初始化及将LNMP配通，可以参考[CentOS系统初始化设置](https://mos.meituan.com/library/initial-setup-with-centos)和[在CentOS 6上搭建LNMP环境](https://mos.meituan.com/library/how-to-install-lnmp-on-centos6)。

* * *

# 下载安装WordPress

将LNMP环境安装配置好之后，就可以安装WordPress了。

输入以下命令：

```
sudo yum install wordpress

```

按照提示输入`yes`后，WordPress的软件包就下载和安装完成了。

* * *

# 配置WordPress

## 配置数据库部分

写博客当然得先建好数据库，下面我们来配置一下MySQL数据库。

进入MySQL:

```
mysql -uroot -p

```

输入root用户的密码进入数据库。接下来就需要创建WordPress数据库了：

```
CREATE DATABASE wordpress;

```

接下来为wordpress创建一个新用户：

```
CREATE USER wpuser@localhost;

```

为此用户设置密码，比如把密码设置成`wordpresspassword`：

```
SET PASSWORD FOR wpuser@localhost=PASSWORD("wordpresspassword");

```

还要为此用户设置访问wordpress数据库的权限：

```
GRANT ALL PRIVILEGES ON wordpress.* TO wpuser@localhost IDENTIFIED BY 'wordpresspassword';

```

最后将权限生效：

```
FLUSH PRIVILEGES;

```

MySQL部分就设置完了。下面我们还要打开WordPress的配置文件`/etc/wordpress/wp-config.php`，将刚才对数据库的设置写到这里。找到文件中MySQL的部分，对其进行如下设置：

```
// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wpuser');

/** MySQL database password */
define('DB_PASSWORD', 'wordpresspassword');

/** MySQL hostname */
define('DB_HOST', 'localhost');

```

## 配置Nginx部分

这时WordPress已经安装完毕，但是现在需要配置一下Nginx，使我们可以通过浏览器访问WordPress，在/etc/nginx/conf.d目录中新建一个名为wordpress.conf的文件，其内容为：

```
server {
    listen 8000;
    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    location ~ \.php$ {
        root           /usr/share/wordpress;
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
        include        fastcgi_params;
    }
}

```

其中：`listen`参数代表指定访问端口。

然后执行以下命令将Nginx重置一下：

```
sudo service nginx reload

```

## 配置防火墙

如果您服务器上安装有防火墙应用，例如firewalld，或者在美团云中设置了防火墙规则，需要进行设置防火墙，将TCP 8000端口开放。

## 配置WordPress

此时我们在浏览器中打开相应的URl就可以开始执行WordPress的安装了，端口号为之前配置文件中设置的：

```
http://yourIP:8000/wp-admin/install.php

```

在出现的网页中将下面几项基础配置填完:

![wordpress admin](http://www.mtmos.com/article_image/p/ccc91e338a0980edc80b3baeb0de724f.png?Signature=urhIyg1vyL918kFHS3hPyr8XnzY%3D&Expires=1473507743&AWSAccessKeyId=be6f297763de4d7a9abe38231aeaa97d)

再用刚才填过的账号登录进去，就可以了随意折腾你的博客了！
