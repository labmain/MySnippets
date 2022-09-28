# 同时连接多个设备， adb移除多余设备
```bash
jacliu@Jacs-MacBook-Pro ~ % adb devices
List of devices attached
DDYNW20603001725 device
K6S4041231B0050 device
```


我只需要连接一台设备，不需要连接2台设备，而且我需要安装apk在一个设备上

輸入指令：`adb -s K6S4041231B0050 kill-server`