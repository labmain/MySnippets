使用 Screen 可以在远程连接关闭后仍然运行您之前运行的程序。这样在远程连接断开、丢失的情况下，保证我们的程序正常运行，并且重新连接 SSH 后，可以打开之前的 Screen 会话。

Screen 只能在 Unix/Linux 环境和 Mac OS X 下运行。

#### 安装 GNU Screen

本部分介绍了在不同的系统中如何安装 Screen 软件。

您首先需要拥有 root  权限。

Debian 或 Ubuntu 系统您可以使用如下命令升级系统然后安装 Screen 软件：

```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install screen

```
CentOS 或 Fedora 系统使用如下命令安装 screen ：

```
sudo yum update
sudo yum install screen
```

如果您使用的是 Arch Linux 系统，可以使用如下命令安装：

```
sudo pacman -Sy
sudo pacman -S screen
```

对于 Gentoo 系统：

```
sudo emerge --sync
sudo emerge screen
```

Mac OS X 在默认情况下就已经安装了 Screen ，您不需要额外的安装。

##### Screen 基础教程

1，在目前终端下输入 `screen` 命令

2，当 screen 运行后，运行您想运行的应用程序。

如果您想关闭目前的会话但是不希望影响会话中运行的程序， 输入 `Ctrl+a+d`  或直接关掉终端即可。如果您关闭了会话，您刚才运行的程序还在继续。您可以使用 `screen -r` 命令返回之前的会话。

##### 常用screen参数

```
screen -S yourname -> 新建一个叫yourname的session
screen -ls -> 列出当前所有的session
screen -r yourname -> 回到yourname这个session
screen -d yourname -> 远程detach某个session
screen -d -r yourname -> 结束当前session并回到yourname这个session
```

##### 管理 Screen

一旦您使用 screen -r 命令，您将会返回到最后退出的那个会话中。不过有时候我们需要处理多个 Screen 会话，每个会话有一个进程 ID。使用 `screen -ls` 命令可以显示所以的 screen 会话，如下：

```
user:~$ screen -r
There are several suitable screens on:
25028.pts-19.XXX-serv8  (01/06/2014 08:15:34 PM)    (Attached)
24658.pts-19.XXX-serv8  (01/06/2014 08:11:38 PM)    (Detached)
24509.pts-19.XXX-serv8  (01/06/2014 08:10:00 PM)    (Detached)
18676.pts-5.XXX-serv8   (01/05/2014 08:55:33 PM)    (Attached)
```

我们可以使用 PID 来再次回到之前的 screen 会话中：

```
screen -r <id>
```

如果 screen 会话是 attached 状态，但是您看不到，可以使用如下命令来解决：

* `screen -dr` 重置一个 screen 会话，然后再次重新连接。
* `screen -x` 强制连接一个正在运行的 screen 会话。
* `screen -DDR `关闭一个 screen 会话，然后强制重新连接，当 `screen -dr `这个命令不好用时，可以使用它。
* `screen -A` 强制 screen 会话适应当前的屏幕大小。

##### 操作 Screen 会话

在 Screen 会话中，您可以使用如下命令操作：

`Ctrl+a c` 创建一个新的 Screen 窗口，默认从 0 开始。

`Ctrl+a 0-9 `在 0-9 直接切换 Screen 窗口。

`Ctrl+a x` 锁定目前的窗口，您需要输入密码来解锁。

`Ctrl+a n` 切换到下一个 Screen 窗口。

`Ctrl+a k` 杀死目前的 Screen 窗口，您需要再次输入 y 或 x 确认。

`Ctrl+a A` 为当前的会话命名

`Ctrl+a d` 断开当前会话

`Ctrl+a ?` 列出 Screen 帮助参数。

`ctrl+a :sessionname my_screen_name` 修改窗口名称

##### Screen 高级应用

**连接 SSH 同时使用 Screen**

我们可以在连接 SSH 同时使用 Screen 软件:

`ssh -t @ screen -r`

修改 Screen 的默认配置文件

Screen 的配置文件在 /etc/screenrc 和 /etc/etcscreenrc ，您可以使用 nano 或 vi 命令打开进行修改