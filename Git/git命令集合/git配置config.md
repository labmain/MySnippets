Git的设置文件为.gitconfig，它可以在用户主目录下（全局配置），也可以在项目目录下（项目配置）。

* 显示当前的Git配置
```
$ git config --list
```
* 编辑Git配置文件
```
$ git config -e [--global]
```
* 设置提交代码时的用户信息
```
$ git config [--global] user.name "[name]"
$ git config [--global] user.email "[email address]"
```
