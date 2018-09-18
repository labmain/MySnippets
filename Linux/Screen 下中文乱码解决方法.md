原来如果需要切换utf8编码，只需要对应命令加上 -U 即可，于是，

后来使用的操作命令如下，再也没出现过中文乱码了：

```bash
#创建utf8编码模式的新会话
screen -U -S new_screen_test
#查看当前会话
screen -ls
#切换会话(utf8编码查看)
screen -U -r new_screen_test
```