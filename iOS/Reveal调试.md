## 模拟器调试

不修改Xcode项目加载Reveal
http://www.jianshu.com/p/9229812b2038

## 针对调试Reveal - 需要越狱

一、在Cydia中下载Reveal Loader (作者不更新了。。。。2017年10月13日)
<!-- 打开Cydia，在BigBoss源搜索“Reveal Loader”，唯一的一个搜索结果就是我们的目标啦！下载之~ --> （新版本失效了）
https://susnmos.github.io/14843616991443.html

二、在“设置”中配置Reveal Loader
选择你要调试的App，把右侧开关打开就是了。
注意，Reveal Loader支持多App调试，也就是你可以打开多个开关。
三、在iOS上打开你要调试的App，在OSX上打开Reveal，开始调试
确保iOS和OSX在同一个IP网段内


## 自己解决

* 在Cydia中搜索并安装Reveal2Loader
    安装Reveal2Loader（注意不是RevealLoader，那个源版本太老了）。在cydia中，搜索Reveal2Loader,然后安装。
    如果安装失败，在软件源中点击编辑->删除BigBoss。接着点击Tabbar上的Cydia -> 更多软件源重新安装BigBoss(比较慢).再试着安装Reveal2Loader

* 远程连接iPhone设备

1. 在Cydia中安装OpenSSH工具
2. 打开Wi-Fi设置，获取IP地址（例如：192.168.2.6）
3. 打开终端，执行命令ssh root@[设备IP地址]（例如：ssh root@192.168.2.6）
    等待几分钟后，允许新连接
    输入密码`alpine`登录iPhone设备

5. 打开 Reveal ->help->show reveal library in finder->iOS-Libraries,找到 RevealServer.framework ，把此文件 拷贝到手机上的 /Library/Frameworks（怎么拷贝？百度咯～）

6. 重启设备
    可以在设备上执行命令：killall SpringBoard 也可以重启设备
