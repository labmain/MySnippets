## 安装
`brew install autojump`

安装完autojump后 把下面放到 ~/.zshrc 文件里
`[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh`

请在 .zshrc 文件相应的位置，找到 plugins=() 这行,添加 autojump 记得各插件名之间用英文空格隔开

修改立即生效 `source ~/.zshrc`

cd 过一次的目录 下次都可以直接跳转

## 使用方法：

1. autojump [目录名字的一部分]

    autojump加一部分名字即可自动跳转到数据库中对应目录去。使用了oh my zsh还可以敲tab自动补全用于直观的选择，很方便。

2. autojump有一个自带的`alias：j`。

    因此简单的输入

    `j dir`

3. 对于权重数据库的访问。

    autojump可以修改目录数据库来达到自定义想要的目录的效果。
    ```
    $ autojump -a [dir]
    # 在数据库中添加一个目录

    $ autojump -i [value]
    # 提升当前目录value数目的权重

    $ autojump -d [value]
    # 降低当前目录的权重

    $ autojump -s
    # 显示数据库中的统计数据

    $ autojump --purge
    # 清除不再需要的目录
    ```

4. 利用 `j –s` 可以看你的历史路径库
    ```
    $ j -s
    17.3:	/Users/shun/Data
    ________________________________________

    17:	 total weight
    1:	 number of entries
    17.32:	 current directory weight

    data:	 /Users/shun/Library/autojump/autojump.txt
    ```
