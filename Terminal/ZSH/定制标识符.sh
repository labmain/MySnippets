使用上zsh后，发现命令提示符显示不了当前的路径，和一般的Linux系统默认提示不一致。配置自己的提示符:
更改配置文件.zshrc，添加配置PROMPT='%m:%. $',重新打开一个窗口生效。
相关配置提示符如下：

%%  一个'%'
#%) 一个')'
%y  当前的tty名
%l  当前的tty名，如 pts/1
%M  完整主机名
%m  主机名（在第一个句号之前截断）
%n  当前用户名
%. %c %C 前两个显示相对路径的当前文件夹名，最后一个是绝对路径（也就是说，前两个在家目录下显示'~'，最后那个显示你的用户名），'%'后的数字表示显示几层路径
%N  zsh 正在执行的脚本/函数名。如果'%'后跟了数字，似乎还有其他作用
%L  当前shell的层数，可以参考《盗梦空间》的层数
%j  当前正在进行的工作数量
%i  与%!类似：The line number currently being executed in the script, sourced file,<br>         or shell function given by %N. This is most useful for debugging as part of $PS4.
%!  显示当前历史事件号码（也就是打开shell后第几条命令）
%/ %d   显示当前工作路径（$pwd）。如果'％'后面是一个整数，它指定显示路径的元件的数量;没有数字就显示整个路径。一个负整数就是指定主目录，即％-1d代表第一部分
%~  目前的工作目录相对于～的相对路径
%?  返回最后命令的执行结果的代码
%#  用户组，#（普通用户）/%（超级用户）


详细见：https://github.com/bolasblack/BlogPosts/blob/master/2011-04-20-%E5%AE%9A%E5%88%B6%E4%BD%A0%E7%9A%84_zsh_%E5%91%BD%E4%BB%A4%E6%8F%90%E7%A4%BA%E7%AC%A6.md
