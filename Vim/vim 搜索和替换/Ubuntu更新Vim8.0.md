## 更新命令

```bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

在这里，执行第一个命令的时候，可能回出现找不到`add-apt-repository`的提示：
`sudo: add-apt-repository: command not found`

其实 `add-apt-repository` 是由`python-software-properties`这个工具包提供的，所以安装一下`python-software-properties`：

`sudo apt-get install python-software-properties`

然后再执行一下`sudo add-apt-repository ppa:jonathonf/vim`,发现还是提示`sudo: add-apt-repository: command not found`，那么再安装一下`software-properties-common`：

`sudo apt-get install software-properties-common`

## 取消更新

当然，如果有一天你玩的不爽了，也可以卸载掉它，还原到Ubuntu官方提供的预装Vim版本，命令如下：

```bash
sudo apt install ppa-purge
sudo ppa-purge ppa:jonathonf/vim
```