
原地址：https://rene.margar.fr/2012/05/client-nut-pour-esxi-5-0/

# 开启ssh
# scp上传文件
# 设置软件安装策略，否则会被阻止安装
$ esxcli software acceptance set --level CommunitySupported
# 设置NUT

接着登录 ESXi，打开管理，高级设置，找到 NUT 相关的设置选项：

UserVars.NutUpsName：ups@10.10.10.111（这里的地址填你们群晖的地址）
UserVars.NutUser：monuser
UserVars.NutPassword：secret
UserVars.NutFinalDelay：60（关机时间，我这是1分钟后关闭esxi）
 
配置完后在vSphere Client的配置-安全配置文件-服务-NutClient设置与主机一起启动和停止（NutClient是守护进程，要先配置UserVars中的NUT参数再运行NutClient服务。并且每次修改UserVars参数后都要重启NutClient服务才有用）

# 验证连接

ssh 中执行 /opt/nut/bin/upsc ups@10.10.10.111 ，如果输出类似如下信息，则表示连接 ups 成功：

```
[root@localhost:~] /opt/nut/bin/upsc ups@10.10.10.111
battery.charge: 100
battery.charge.low: 10
battery.charge.warning: 50
battery.date: not set
battery.mfr.date: 2018/11/04
battery.runtime: 3937
battery.runtime.low: 120
battery.type: PbAc
battery.voltage: 13.5
battery.voltage.nominal: 12.0
device.mfr: APC
device.model: Back-UPS 650
...
```

# 验证防火墙

验证防火墙设置，执行 esxcli network firewall ruleset list，如果看到 NutServer 为 ture 则表示正常。

# 设置随机启动
最后在 ESXi 的服务里面设置 Network UPS Tools client 服务随系统启动即可！