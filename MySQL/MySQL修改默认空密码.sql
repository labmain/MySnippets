1. 方法一：
使用phpMyAdmin打开mysql数据库
使用sql语句修改：
UPDATE user SET password=PASSWORD('要修改的密码') WHERE user='root';
注意：修改之后需要到phpMyAdmin目录下修改config.inc.php下的root密码
2. 方法二：
cmd下切换到 mysql 安装目录
d:/mysql/bin   (如果用WAMP安装则是D:\wamp\bin\mysql\mysql5.1.30\bin)
前提：mysql用户root密码为空.
输入 mysql -u root mysql
mysql> 状态下输入   update user set password=password('新密码') where user='root';

注意进入mysql> 命令状态后，每个命令后都要加上一个分号 ";"
mysql 才开始执行该行命令

重起 mysql .
在更新 root 密码后，以后要与 MySQL 连接的方法为：

mysql -u root -p 新密码，测试是否修改成功
