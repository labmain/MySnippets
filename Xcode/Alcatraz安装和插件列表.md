### 安装

>> Xcode8之后不能使用！！！

1. Github上下载Alcatraz
    https://github.com/alcatraz/Alcatraz
2. Alcatraz是xcode的插件，这个插件的作用是管理插件
3. 下载安装，或者打开终端 输入 （使用如下的命令行来安装 Alcatraz：）
```
curl -fsSL https://raw.githubusercontent.com/supermarin/Alcatraz/deploy/Scripts/install.sh | sh
```

等下载完后你会在 你本地的路径下/Users/主机名（自己的）`/Library/Application Support/Developer/Shared/Xcode/Plug-ins/Alcatraz.xcplugin ` 发现多了一个`Alcatraz.xcplugin `

### 问题
下载完一个插件后可能有的插件不能用（例如VVDocument）
解决办法
1. 打开xcode插件所在的目录：
~/{当前用户名}/library/Application Support/Developer/Shared/Xcode/Plug-ins
2. 选择已经安装的插件例如VVDocument，右键点击显示包内容，
3. 找到info.plist 文件，找到DVTPlugInCompatibilityUUIDs的项目，
4. 添加C4A681B0-4A26-480E-93EC-1218098B9AA0（当前xcode的一个号码），这个号码怎么得到？在终端执行 
```
defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID
```
5. 再右键“打开报内容”双击contents\MacOS目录下的一个黑色图标，会打开终端窗口，最后打印“进程已完成”之类，
6. 重启xcode
 
还要注意：安装的插件还要及时更新

### 卸载：
如果你不想使用 Alcatraz 了，可以使用如下命令来删除：
```
rm -rf ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/Alcatraz.xcplugin rm -rf ~/Library/Application\ Support/Alcatraz
```
