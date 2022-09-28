adb kill-server (关闭adb)
adb start-server（开启adb）
adb devices (查看设备)
adb version （adb版本号）

安装指定apk： adb install
卸载指定包 ： adb uninstall
连接设备 ： adb connect [[:]]（默认端口号是：5555）
断开设备： disconnect [[:]]
执行远程的shell：adb shell
执行远程shell命令： adb shell
拷贝文件到设备上： adb push
从设备中拷贝文件：adb pull []
查看设备所有信息： adb bugreport（包括 bug 报告）


# 