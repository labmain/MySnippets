
1. 用gem查看pods的版本有哪些
`gem list`

2. 移除当前的pod版本
`sudo gem uninstall cocoapods -v (移除的版本号)`

成功的话会输出
`Successfully uninstalled cocoapods-(移除的版本号) `

如果有两个或者多个版本的pods 就在执行一次 （2），最后一个的时候会输出

```bash
Remove executables:
        pod, sandbox-pod
 
in addition to the gem? [Yn]
```

直接回车移除，至此移除了原来的版本

3. 安全你装你想要的版本
`sudo gem install cocoapods -v (要安装的版本号)`
完成后查看pod 版本。`pod --version` 看到输出的是你指定的版本就ok了。