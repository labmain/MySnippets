1. 检查httpd.conf是否开启（一般默认是开启）
```
# Virtual hosts
#Include conf/extra/httpd-vhosts.conf
```
这一段把Include conf/extra/httpd-vhosts.conf前面的"#"去掉。

2. 修改httpd-vhosts.conf
NameVirtualHost \*:80
去掉#

3. 配置说明：

```
#<VirtualHost *:*>
#    ServerAdmin          # 管理员的E-mail地址
#    DocumentRoot         # 虚拟主机的根目录
#    ServerName           # 虚拟主机的名称端口
#    ErrorLog             # 虚拟主机的错误日志路径
#    Customlog            # 虚拟主机的访问日志路径
#</VirtualHost>
```
4. 范例
```
<VirtualHost *:80>
ServerName o2jam.nanyei.com
DocumentRoot D:/web/o2jam
</VirtualHost>
```
