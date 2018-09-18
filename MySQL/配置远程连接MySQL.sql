0. 开启远程访问 （记得查看3306端口是能够访问）

vim /etc/mysql/my.cnf

(5.7版本路径：/etc/mysql/mysql.conf.d/mysqld.cnf)

找到：
 bind-address           = 127.0.0.1
    这行，注释掉（如下）
#bind-address           = 127.0.0.1
    或者改为
 bind-address           = 0.0.0.0
    允许任意IP访问，或者自己指定一个IP地址。

1.然后重启 MySQL
sudo service mysql restart

2.授权用户远程登录

mysql -u root -p;

use mysql;

grant all privileges on *.* to root@"%" identified by "gr3eLyoCigZiigwN" with grant option;

flush privileges;

    第一行命令解释如下，*.*：第一个*代表数据库名；第二个*代表表名。这里的意思是所有数据库里的所有表都授权给用户。

    root：授予root账号。

    “%”：表示授权的用户IP可以指定，这里代表任意的IP地址都能访问MySQL数据库。

    password”：分配账号对应的密码。

    flush privileges; 刷新权限

3. 连接数据库（也可以使用连接软件）

通过mysql客户端连接到远程的MySQL数据库

    在自己本地mysql客户端中输入：

 mysql -h ip -u root -p;

   其中ip是你访问数据库所在服务器的IP地址
