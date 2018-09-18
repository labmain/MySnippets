## 方案一：脚本密码登录 

```bash
#!/usr/bin/expect -f
  set user <用户名>
  set host <ip地址>
  set password <密码>
  set timeout -1

  spawn ssh $user@$host
  expect "*assword:*"
  send "$password\r"
  interact
  expect eof
```

保存以上到xx.sh

`expect <保存的脚本完整路径>`


## 方案二：秘钥登陆

进入系统的ssh证书目录

`cd ~/.ssh/`

建立证书文件
`ssh-keygen -t rsa`


输入 `ls` 命令查看当前目录会发现新生成的一对秘钥文件分别是：

公钥：id_rsa.pub
私钥：id_rsa

将公钥文件上传到远程服务器用户主目录下的.ssh文件下（如果没有就新建一个）

```bash
scp -P 22 /Users/shun/.ssh/id_rsa.pub root@xx.xxx.xxx.xx:~/.ssh/id_rsa.pub
```

登陆到远程服务器，进入.ssh目录
`cd ~/.ssh`

执行命令 
`cat id_rsa.pub >> authorized_keys`
再执行命令
 `rm id_rsa.pub` （删除之前上传的公钥）

退出远程服务器
在Mac终端下执行登陆命令 
`ssh username@server`
即可免密码登录到远程服务器


