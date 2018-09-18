## Zsh
Mac 系统自带了 Zsh, 一般不是最新版，如果需要最新版可通过 Homebrew 来安装
`brew install zsh`
可通过 `zsh --version` 命令查看 Zsh 的版本
使用 `echo $SHELL` 命令查看当前使用的 shell
修改默认 Shell
在 /etc/shells 文件中加入如下一行
`/usr/local/bin/zsh`
然后运行命令
`chsh -s /usr/local/bin/zsh`

## 修改立即生效

修改立即生效 `source ~/.zshrc`

## Oh My Zsh

Oh My Zsh 用来管理 Zsh 配置的，自带了好用的基本配置，基本都是 Zsh 的标配了，你不用再一步步重新配置 Zsh ，节约你的宝贵时间

项目主页：https://github.com/robbyrussell/oh-my-zsh

注意⚠️ ：安装的时候不要在zsh下安装。。。

* via curl

    ```
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ```
* via wget

    ```
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    ```

安装方法见主页，很简单就不说了，下面说说一些常用的好用的功能：
`配置文件在 ~/.zshrc`

## zsh插件


Oh My Zsh 本身自带了很多插件，不过基本都没有启用，插件目录 `~/.oh-my-zsh/plugins`
例如启用插件 git, autojump osx, 需要在配置文件中加入如下内容

`plugins=(git autojump osx)`

## 使用技巧

### 使用技巧

1. 连按两次Tab会列出所有的补全列表并直接开始选择，补全项可以使用 ctrl+n/p/f/b上下左右切换
2. 命令选项补全。在zsh中只需要键入 `tar -<tab>` 就会列出所有的选项和帮助说明
3. 命令参数补全。键入 `kill <tab>` 就会列出所有的进程名和对应的进程号
4. 更智能的历史命令。在用或者方向上键查找历史命令时，zsh支持限制查找。比如，输入`ls`,然后再按方向上键，则只会查找用过的ls命令。而此时使用则会仍然按之前的方式查找，忽略 `ls`
5. 多个终端会话共享历史记录
6. 智能跳转，安装了 autojump 之后，zsh 会自动记录你访问过的目录，通过 `j 目录名` 可以直接进行目录跳转，而且目录名支持模糊匹配和自动补全，例如你访问过 hadoop-1.0.0 目录，输入`j hado` 即可正确跳转。`j --stat` 可以看你的历史路径库。
7. 目录浏览和跳转：输入 d，即可列出你在这个会话里访问的目录列表，输入列表前的序号，即可直接跳转。
8. 在当前目录下输入 `..` 或 `...` ，或直接输入当前目录名都可以跳转，你甚至不再需要输入 cd 命令了。在你知道路径的情况下，比如 `/usr/local/bin` 你可以输入 `cd /u/l/b` 然后按进行补全快速输入
9. 通配符搜索：`ls -l **/*.sh`，可以递归显示当前目录下的 shell 文件，文件少时可以代替 find。使用 `**/` 来递归搜索
10. 扩展环境变量，输入环境变量然后按 就可以转换成表达的值
11. 在 `.zshrc` 中添加 `setopt HIST_IGNORE_DUPS` 可以消除重复记录，也可以利用 `sort -t ";" -k 2 -u ~/.zsh_history | sort -o ~/.zsh_history` 手动清除

更多参加：https://wiki.archlinux.org/index.php/Zsh_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)
