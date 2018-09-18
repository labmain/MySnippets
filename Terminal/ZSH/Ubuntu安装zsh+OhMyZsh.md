安装zsh：

1. `sudo apt-get install zsh`安装zsh
2. `zsh --version`确认是否安装成功
3. `sudo chsh -s $(which zsh)`设置zsh为默认shell
4. 注销重新登录
5. `echo $SHELL`确认zsh是否是默认SHELL，输出`/usr/bin/zsh`

安装 OhMyZsh
```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

ps:需要安装git