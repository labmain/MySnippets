一、在线安装：

　　Ubuntu：`sudo apt-get install nginx`
　　CentOS:　`sudo yum install nginx`

二、安装后的位置：

　　1、服务地址：`/etc/init.d/nginx`　
　　2、配置地址：`/etc/nginx/`　　如：/etc/nginx/nginx.conf
　　3、Web默认目录：`/usr/share/nginx/http/`　　如：usr/share/nginx/index.html
　　4、日志目录：`/var/log/nginx/`　　如：/var/log/nginx/access.log
　　5、主程序文件：`/usr/sbin/nginx`


三、启动服务：

　　输入命令：　`sudo systemctl restart nginx.service `

　　或者：`sudo service nginx restart`  


示例：

比如我要配置下面两个网站：
　　　　（1）通过http://localhost:8080/ 访问一个存放于磁盘位置：`/var/www/html/` 下的网站。
　　　　（2）通过http://localhost:80/ 访问一个存放于磁盘位置：`/var/www/myweb/` 下的网站。
　　　　实现过程：
　　　　（1）打开`cd`到`/etc/nginx/sites-available`目录，使用`sudo vim ./default` 来修改该目录下的default的配置文件：
　　　　　　将配置信息修改为下图所示即可：

```bash
server {
        listen 8080 default_server;
        listen [::]:8080 default_server;
        # SSL configuration
        #
        # listen 443 ssl default_server;
        # listen [::]:443 ssl default_server;

        root /var/www/html;

        # 首页配置
        index index.html index.htm index.nginx-debian.html;

        server_name _ ;

        location / {
                try_files $uri $uri/ =404;
        }                
}
server {
        listen 80;
        listen [::]:80;
        server_name myweb;

        root /var/www/myweb;
        index index.html;
        location / {
                try_files $uri $uri/ =404;
        }
}
```
