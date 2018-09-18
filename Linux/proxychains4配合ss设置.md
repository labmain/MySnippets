## 安装 proxychains4

```bash
git clone https://github.com/rofl0r/proxychains-ng
./configure
make
make install
# installs /etc/proxychains.conf
sudo make install-config 
```

## 配置

`vim /etc/proxychains.conf`

```bash
dynamic_chain
chain_len = 1 #round_robin_chain和random_chain使用
proxy_dns
remote_dns_subnet 224
tcp_read_time_out 15000
tcp_connect_time_out 8000

[ProxyList]
socks5  127.0.0.1 1080 # ss 的代理端口
```

## 测试

需要现开启ss

```bash
$ proxychains4 curl ip.cn
[proxychains] config file found: /etc/proxychains.conf
[proxychains] preloading /usr/lib/libproxychains4.so
[proxychains] DLL init: proxychains-ng 4.12-git-14-g06c20ed
[proxychains] Random chain  ...  127.0.0.1:1080  ...  ip.cn:80  ...  OK
当前 IP：61.244.19.6 来自：香港特别行政区 香港宽频
```

## 配置说明

代理模式在配置文件最开头, 有四种模式供选择, 关闭某模式就是注释掉就可以了. 默认模式是strict_chain

dynamic_chain，按照列表中出现的代理服务器的先后顺序组成一条链，如果有代理服务器失效，则自动将其排除，但至少要有一个是有效的。
strict_chain，按照后面列表中出现的代理服务器的先后顺序组成一条链，要求所有的代理服务器都是有效的
round_robin_chain, 类似dynamic_chain, 但是只读取chain_len 长度
random_chain，列表中的任何一个代理服务器都可能被选择使用，这种方式很适合网络扫描操作（参数chain_len对random_chain有效）。
默认是选择的strict_chain，一般我们不用多个代理造成链, 只要一个就好了, 所以一般不改变代理模式部分。