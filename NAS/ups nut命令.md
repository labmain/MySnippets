## macOS安装 nut

```
brew install nut
```


## upsc 查看ups信息

```
upsc ups@10.0.0.5

upsc ups@10.0.0.5 ups.load
```

## macOS 配置 nut
ps: https://diktiosolutions.eu/en/synology/synology-ups-nut-en/

Synology NAS 上的配置文件可在此处找到：
```
/usr/syno/etc/ups
```

配置： 
upsmon.conf
upssched.conf


手动启动：
```bash
# 后台启动
sudo upsmon -D
# 停止
sudo upsmon -c stop
# 重新启动
sudo upsmon -c reload
```

## 配置启动项
sudo vim /Library/LaunchDaemons/org.networkupstools.upsmon.plist

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>Label</key>
<string>org.networkupstools.upsmon</string>
<key>RunAtLoad</key>
<true/>
<key>ProgramArguments</key>
<array>
<string>/opt/homebrew/sbin/upsmon</string>
<string>-D</string> <!-- "-D" keeps upsmon from going into the background -->
</array>
<key>KeepAlive</key>
<true/>
<key>SuccessfulExit</key>
<false/> <!-- Do not respawn at shutdown time -->
</dict>
</plist>
```

sudo launchctl load /Library/LaunchDaemons/org.networkupstools.upsmon.plist

# 要查看它是否正在运行：

sudo launchctl list|fgrep -v com.app

ps -ef |grep upsmon


## 模拟电源故障-强制关闭(服务器上用)
```
upsmon -c fsd
```