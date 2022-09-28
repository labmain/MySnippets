https://blog.csdn.net/u010263943/article/details/126145611


# 如果遇到需要 Gadget

解决办法在如下地址下载配套的gadget： 

https://github.com/frida/frida/releases/
下载并解压与你的frida对应版本和型号的Gadget，然后执行如下代码：

$ mkdir -p ~/.cache/frida
$ cp frida-gadget-15.1.17-android-x86.so ~/.cache/frida/gadget-xxx.so


## 命令

```
-ns：不显示日志。默认显示
-f： 保存app行为轨迹到到execl里。默认不保存
-t： hook应用自己的函数或含壳时，建议使用setTimeout并给出适当的延时(1-5s，需要根据不同app进行调整)。以免hook失败。默认不延迟
-u： 扫描指定模块。与命令-nu互斥。多个模块用','隔开。例如：phone,permission
-nu：跳过扫描指定模块。与命令-u互斥。多个模块用','隔开。例如：phone,permission
```