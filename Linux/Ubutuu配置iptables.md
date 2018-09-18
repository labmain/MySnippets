##### 查看系统是否安装防火墙:
```
whereis iptables
```
##### 安装
```
apt-get install iptables
```

##### 查看防火墙配置信息，显示如下:
```
iptables -L
```

##### 查看生效的上述iptables规则
```
iptables -t nat -L -n --line-numbers
```
##### 删除全部规则
```
iptables -t nat -F
```
