由于用Esxi作为底层的话，是看不到硬盘的通道的，所以需要使用SSH来手动开启

本方案适用于ESXi6.5、ESXi6.7和ESXi7.0

！！！！注意！！！！！：  
如果镜像在SATA上的话，不能直通AHI控制器。
## 开启步骤
1. 进bios设置控制器工作模式为ahci（默认应该就是这个，检查一下） 
2. 安装好ESXI，并开启SSH登陆权限 
3. 插入一块硬盘，没有硬盘的话esxi里是不显示控制器的 
4. SSH登陆ESXI主机 执行以下命令
    `vi /etc/vmware/passthru.map`
5. 在配置文件末尾添加下面的代码
    ```
    # Intel Point SATA AHCI controller
    8086 a352 d3d0 false
    ```
6. 保存并退出，重启ESXI 7.在控制台里面去进行直通操作，提示错误的话，重新引导几次即可


# Cannon Lake PCH USB 3.1 xHCI Host Controller
8086 a36d d3d0 false