开机按shift + R


1. 在ESXi主机的控制台屏幕中，按Ctrl + Alt + F2以查看直接控制台用户界面（DCUI）屏幕。
2. 按F12可查看ESXi主机的关机选项。
3. 按F11可重新引导。
4. Hypervisor进度条开始加载时，按Shift + R。您将看到一个包含以下警告的发布窗口：

当前管理程序将永久替换为
内部版本：XXX-XXXXXX。是否确定？[Y / n]
（当前Hypervisor将永久替换
为内部版本：XXX-XXXXXX。确定吗？[是/否]）
 
4. 按Y可回滚至该内部版本。
6. 按输入引导。