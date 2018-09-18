关闭网站，数据库备份，网站数据，上传备份文件，修改IP地址和数据库连接，还原。域名解析

Wordpress会碰到的问题：
更新插件会遇到权限问题，需要
chmod -R 755 /var/www/wordpress
chown -R www /var/www/wordpress
网站跟原服务器的服务挂钩，需要重新修改原服务器的连接。

discuz会碰到的问题：
