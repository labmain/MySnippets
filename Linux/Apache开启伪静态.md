### 你要通过修改 httpd.conf 来配置。
1. 启用rewrite
    * 用记事本打开 httpd.conf后 ，点编辑－－查找 LoadModule rewrite
    `# LoadModule rewrite_module modules/mod_rewrite.so`
    * 去除前面的 #  
    LoadModule rewrite_module modules/mod_rewrite.so  
2. 启用.htaccess（支持配置文件中读取规范）
    * AllowOverride None    修改为： AllowOverride All
    * Options Indexes FollowSymLinks   修改为：Options All

### 重启你的 apache 服务
然后新建文件复制Apache主机下的Discuz! X2和Discuz! X2.5伪静态规则保存重命名为.htaccess，把.htaccess上传到论坛根目录即可。


### 虚拟主机下的伪静态开启
1. 打开 Apache 的配置文件 httpd.conf 。 
2. 将#LoadModule rewrite_module modules/mod_rewrite前面的#去掉 
3. 将，AllowOverride all 原来None的要改成all。 
4. 
httpd-vhosts.conf文件修改
```
<VirtualHost *:80>
ServerName o2jam.nanyei.com
DocumentRoot D:/web/o2jam
<Directory "D:/web/o2jam"> 
Options Indexes FollowSymLinks Includes 
AllowOverride All 
order allow,deny 
Allow from all 
</Directory>
```
