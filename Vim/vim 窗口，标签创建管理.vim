多标签
进入vim前
  vim -p <文件名> 以多标签形式打开文件。如vim -p * 就是编辑当前目录的所有文件，
vim编辑中
:tabnew     增加一个标签
:tabc       关闭当前的tab
:tabo       关闭所有其他的tab
:tabs       查看所有打开的tab
:tabp 或gT  前一个
:tabn 或gt  后一个
新建标签页

:tabe <文件名>  在新标签页中打开指定的文件。
:tabnew <文件名>  在新标签页中编辑新的文件。
:tab split  在新标签页中，打开当前缓冲区中的文件。
:tabf  允许你在当前目录搜索文件，并在新标签页中打开。比如:tabf img.*。此命令只能打开一个文件.
Vim默认最多只能打开10个标签页。你可以用set tabpagemax=15改变这个限制。
列示标签页
:tabs  显示已打开标签页的列表，并用“>”标识出当前页面，用“+”标识出已更改的页面。
关闭标签页
:tabc  关闭当前标签页。
:tabo  关闭所有的标签页。
切换标签
:tabn或gt  移动到下一个标签页。
:tabp或gT  移动到上一个标签页。
:tabfirst或:tabr  移动到第一个标签页。
:tablast  移动到最后一个标签页。
移动标签页
:tabm [次序]  移动当前文件的标签页次序。比如:tabm 1将把当前标签页移动到第2的位置。如:tabm不指定参数将被移动到最后。
配置标签页
:set showtabline=[1,2,3]  标签页在窗口上方显示标签栏。=0完全不显示标签栏，=1只有用户新建时才显示，=2总是显示标签栏。
多标签页命令
:tabdo <命令>  同时在多个标签页中执行命令。比如:tabdo %s/food/drink/g 命令把当前多个标签页文件中的“food”都替换成“drink”。
帮助
:help tab-page-intro命令，可以获得关于标签页使用的更多信息。
窗口
1、打开多个窗口（vim编辑中）
打开多个窗口的命令以下几个：
横向切割窗口
:new+窗口名(保存后就是文件名)
:split+窗口名，也可以简写为:sp+窗口名
纵向切割窗口名
:vsplit+窗口名，也可以简写为：vsp+窗口名

    vim -o file1 file2 ...  #水平打开多窗口，
    vim -O file1 file2 ...  #垂直打开多窗口,
    vim -d file1 file2 ...  #垂直打开多窗口,并且进行比较
    vimdiff file1 file2 ..  #等同于上一句

2、关闭多窗口
可以用：q!，也可以使用：close，最后一个窗口不能使用close关闭。使用close只是暂时关闭窗口，其内容还在缓存中，只有使用q!、w!或x才能真能退出。
 关闭窗口
     q  或 close   #关闭当前窗口
     only          #保留当前窗口，关闭其它所有窗口
     qall(qa)          #退出所有窗口
     wall          #保存所有窗口
3、窗口切换
:ctrl+w+j/k，通过j/k可以上下切换，或者:ctrl+w加上下左右键，还可以通过快速双击ctrl+w依次切换窗口。
4、窗口大小调整
纵向调整
:ctrl+w + 纵向扩大（行数增加）
:ctrl+w - 纵向缩小 （行数减少）
:res(ize) num  例如：:res 5，显示行数调整为5行
:res(ize)+num 把当前窗口高度增加num行
:res(ize)-num 把当前窗口高度减少num行
横向调整
:vertical res(ize) num 指定当前窗口为num列
:vertical res(ize)+num 把当前窗口增加num列
:vertical res(ize)-num 把当前窗口减少num列
5、给窗口重命名
:f file
6、vi打开多文件（进入vim前）
vi a b c
:n 跳至下一个文件，也可以直接指定要跳的文件，如:n c，可以直接跳到c文件
:e# 回到刚才编辑的文件
7、文件浏览
:Ex 开启目录浏览器，可以浏览当前目录下的所有文件，并可以选择
:Sex 水平分割当前窗口，并在一个窗口中开启目录浏览器
:ls 显示当前buffer情况
8、vi与shell切换
:shell 可以在不关闭vi的情况下切换到shell命令行
:exit 从shell回到vi
