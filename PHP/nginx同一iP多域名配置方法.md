nginx绑定多个域名可又把多个域名规则写一个配置文件里，也可又分别建立多个域名配置文件，我一般为了管理方便，每个域名建一个文件，有些同类域名也可又写在一个总的配置文件里。

## 一、每个域名一个文件的写法
      首先打开nginx域名配置文件存放目录：`/usr/local/nginx/conf/servers` ，如要绑定域名`www.itblood.com` 则在此目录建一个文件：www.itblood.com.conf然后在此文件中写规则，如：

```bash
server{
    listen 80;
    server_name www.itblood.com; #绑定域名
    index index.htm index.html index.php; #默认文件
    root /home/www/itblood.com; #网站根目录
    include location.conf; #调用其他规则，也可去除
}
```

然后重起nginx服务器，域名就绑定成功了nginx服务器重起命令：`/etc/init.d/nginx restart`

## 二、一个文件多个域名的写法
一个文件添加多个域名的规则也是一样，只要把上面单个域名重复写下来就ok了，如：

```bash
server{
    listen 80;
    server_name www.itblood.com; #绑定域名
    index index.htm index.html index.php; #默认文件
    root /home/www/itblood.com; #网站根目录
    include location.conf; #调用其他规则，也可去除
}

server{
    listen 80;
    server_name msn.itblood.com; #绑定域名
    index index.htm index.html index.php; #默认文件
    root /home/www/msn.itblood.com; #网站根目录
    include location.conf; #调用其他规则，也可去除
}
```

## 三、不带www的域名加301跳转
    如果不带www的域名要加301跳转，那也是和绑定域名一样，先绑定不带www的域名，只是不用写网站目录，而是进行301跳转，如：
```
server
{
    listen 80;
    server_name itblood.com;
    rewrite ^/(.*) http://www.itblood.com/$1 permanent;
}
```

## 四、添加404网页
    添加404网页，都可又直接在里面添加，如：
```
server{
    listen 80;
    server_name www.itblood.com; #绑定域名
    index index.htm index.html index.php; #默认文件
    root /home/www/itblood.com; #网站根目录
    include location.conf; #调用其他规则，也可去除
    error_page 404 /404.html;
}
```
