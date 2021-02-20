## 登录VMware官网下载最新的升级包

官网地址：https://my.vmware.com

选择 产品-产品与补丁
下载日期更新最新的这个

## 安装

### 开启SSH

后台 -> 管理 -> 服务 找到 SSH 启动

### SSH登陆 ESXi 主机
```bash
[root@esxi:~] vmware -v
VMware ESXi 7.0.0 build-16324942
[root@esxi:~] vmware -l
VMware ESXi 7.0 GA
```

### 确定列表

注意：**使用完整路径**
```
[root@esxi:~] esxcli software sources profile list -d /vmfs/volumes/datastore1/Upgrade/VMware-ESXi-7.0U1c-17325551-depot.zip
Name                            Vendor        Acceptance Level  Creation Time        Modification Time
------------------------------  ------------  ----------------  -------------------  -----------------
ESXi-7.0U1sc-17325020-standard  VMware, Inc.  PartnerSupported  2020-12-15T10:50:21  2020-12-15T10:50:21
ESXi-7.0U1c-17325551-standard   VMware, Inc.  PartnerSupported  2020-12-15T12:44:19  2020-12-15T12:44:19
ESXi-7.0U1c-17325551-no-tools   VMware, Inc.  PartnerSupported  2020-12-15T12:44:20  2020-12-15T12:44:20
ESXi-7.0U1sc-17325020-no-tools  VMware, Inc.  PartnerSupported  2020-12-15T10:50:22  2020-12-15T10:50:22
```
### 安装更新
```
[root@esxi:~] esxcli software profile update -d /vmfs/volumes/5f7480cd-f6e07472-20aa-00f1f317f686/Upgrade/VMware-ESXi-7.0U1c-17325551-depot.zip -p ESXi-7.0U1c-17325551-standard
Update Result
   Message: The update completed successfully, but the system needs to be rebooted for the changes to be effective.
   Reboot Required: true
.......
.......
[root@esxi:~] /sbin/reboot
```

### 重启后确认版本

[root@esxi:~] vmware -v
VMware ESXi 7.0.1 build-17325551
[root@esxi:~] vmware -l
VMware ESXi 7.0 Update 1