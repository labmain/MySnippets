
## 安装 ss

`pip install shadowsocks`

## 创建配置文件

```
{
    "server":"服务器 IP 地址",
    "server_port":8388,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"password",
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false,
    "workers": 1
}
```

## 启动ss客户端

`sslocal -c /etc/shadowsocks.conf`

以上命令退出终端会结束，可以采用下命令替代

`nohup sslocal -c /etc/shadowsocks.conf >/dev/null 2>%1 &`

```bash
# 启动
sudo sslocal -c /etc/shadowsocks.json -d start
# 停止
sudo sslocal -c /etc/shadowsocks.json -d stop
```

## 中间代理

由于很多命令`curl`，`wget`以及`apt`等使用的`http`、`https`协议进行通信，显然我们需要中间部分将`http协议`转换成`socks协议`，这样，`socks server`才能实现代理。比较常用的`privoxy`、`polipo`.

`polipo`:配置简单，轻便(适合ubuntu\mac系统)
`privory`:偏重代理中的过滤，功能强大,配置也相对复杂一点

## polipo

`sudo apt-get install polipo`

配置

```bash
sudo vim /etc/polipo/config
# Uncomment this if you want to use a parent SOCKS proxy:
# socks client监听的地址
socksParentProxy = "localhost:1080"
#使用协议版本
socksProxyType = socks5
```


## polipo 控制命令

```bash
sudo systemctl start polipo
sudo systemctl stop polipo
```

## 设置环境变量

```bash
export http_proxy="http://127.0.0.1:8123"  
export https_proxy="https://127.0.0.1:8123"
```

## 检查是否可以使用

```
curl www.google.com  
```

## 最好不要用全局代理

全局代理受速度和稳定性限制，目前的需求只是在一些应用中使用代理的话就无需设置以上环境变量，只需在相应的程序中指定环境变量就好 

例如在R中使用ggmap包获取谷歌地图数据

`Sys.setenv("http_proxy"="http://127.0.0.1:8118")`

