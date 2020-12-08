## 查看当前的ubuntu是否安装了ssh-server服务。默认只安装ssh-client服务。

```dpkg -l | grep ssh```


### 安装ssh-server服务

```sudo apt-get install openssh-server```

### 确认ssh-server是否启动了：

```ps -e | grep ssh```

如果看到sshd那说明ssh-server已经启动了。

### 启动 ssh

```sudo /etc/init.d/ssh start```
或
```sudo service ssh start```
