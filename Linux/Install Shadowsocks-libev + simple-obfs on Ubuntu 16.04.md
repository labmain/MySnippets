# Install Shadowsocks-libev + simple-obfs on Ubuntu 16.04

## Install shadowsocks-libev via Ubuntu PPA

```bash
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:max-c-lv/shadowsocks-libev -y
sudo apt-get update
sudo apt install shadowsocks-libev
```

## Install `simple-obfs`

```bash
sudo apt-get install --no-install-recommends build-essential autoconf libtool libssl-dev libpcre3-dev libev-dev asciidoc xmlto automake
git clone https://github.com/shadowsocks/simple-obfs.git
cd simple-obfs
git submodule update --init --recursive
./autogen.sh
./configure && make
sudo make install
```

## Make ~obfs-server~ able to listen on port 443

```bash
setcap cap_net_bind_service+ep /usr/local/bin/obfs-server
```

## Server configuration
  
  Add below to `/etc/shadowsocks-libev/config.json`

```json
{
    "server":"0.0.0.0",
    "server_port":443,
    "local_port":1080,
    "password":"ChangeMe",
    "timeout":300,
    "method":"chacha20-ietf-poly1305",
    "workers":8,
    "plugin":"obfs-server",
    "plugin_opts": "obfs=tls;obfs-host=www.bing.com",
    "fast_open":true,
    "reuse_port":true
}
```
## Start `shadowsocks-libev` server

```bash
systemctl enable shadowsocks-libev.service
systemctl start shadowsocks-libev.service
systemctl status shadowsocks-libev.service
```
  
## Optimizations

### Install & enable BBR TCP congestion control
```bash
apt install --install-recommends linux-generic-hwe-16.04
apt autoremove
modprobe tcp_bbr
echo "tcp_bbr" >> /etc/modules-load.d/modules.conf
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
```

** MISC
   Add below to `/etc/sysctl.d/local.conf`
```bash
fs.file-max = 51200

net.core.rmem_max = 67108864
net.core.wmem_max = 67108864
net.core.netdev_max_backlog = 250000
net.core.somaxconn = 4096

net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_keepalive_time = 1200
net.ipv4.ip_local_port_range = 10000 65000
net.ipv4.tcp_max_syn_backlog = 8192
net.ipv4.tcp_max_tw_buckets = 5000
net.ipv4.tcp_fastopen = 3
net.ipv4.tcp_mem = 25600 51200 102400
net.ipv4.tcp_rmem = 4096 87380 67108864
net.ipv4.tcp_wmem = 4096 65536 67108864
net.ipv4.tcp_mtu_probing = 1
```

### Reboot

```bash
reboot
```

### Client configuration
Add below to `/usr/local/etc/shadowsocks-libev.json`

Note that the `plugin` has to be absolute path in order to be able to use
`brew services start shadowsocks-libev`.

```json
{
    "server":"SERVER",
    "server_port":443,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"PASSWORD",
    "timeout":300,
    "method":"chacha20-ietf-poly1305",
    "workers":8,
    "plugin":"/usr/local/bin/obfs-local",
    "plugin_opts": "obfs=tls;obfs-host=www.bing.com",
    "fast_open":true,
    "reuse_port":true
}
```
### 命令启动

```bash
ss-local -c config.json --plugin obfs-local --plugin-opts "obfs=http;obfs-host=www.baidu.com"
```


### 启动客户端

```
/etc/systemd/system/*
/run/systemd/system/*
/lib/systemd/system/*
```
不同版本service位置不一样，修改service的配置内容，指定json路径

```sudo vim /lib/systemd/system/shadowsocks-libev-local@xxx.service```

start 配置开机自启
```
sudo systemctl enable shadowsocks-libev-local@xxx.service
```
enable 配置开机自启
```
sudo systemctl enable shadowsocks-libev-local@xxx.service
```
status 查看运行情况
```
sudo systemctl status shadowsocks-libev-local@xxx.service
```

**xxx** 代表json文件名