### 安装 Vundle 插件管理

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

安装之后：在 ～/.vimrc 添加如下内容

```
set nocompatible " 去除VI一致性,必须filetype off " 必须
set filetype off "必须
rtp+=~/.vim/bundle/Vundle.vimcall vundle#begin() "设置插件运行时
Plugin 'pluginName' "设置需要加载的插件列表
call vundle#end() " 必须
filetype plugin indent on " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
```

或者
我们可以把bundle列表单独放在一个文件.vimrc.bundles中，内容如下:

```
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"============================
" Bundle List "
"============================
Plugin 'VundleVim/Vundle.vim'
Plugin 'matten/emmet-vim'
call vundle#end()
filetype plugin indent on
```
然后在.vimrc文件中引用.vimrc.bundles

```
if filereadable(expand("~/_vimrc.bundles"))
source ~/_vimrc.bundles
endif
```

插件管理：

Vim的插件一般有三种:

vim官方github账号(vim-scripts)发布的插件
github用户自行开发的插件
其他插件
虽然同为Vim插件，但是加载到.vimrc中的插件列表的方式有些许不同。
对于第一种插件，直接给出插件的仓库名即可，如

Plugin 'pluginName'
对于第二种插件，需要指定github用户名/仓库名，如

Plugin 'userName/pluginName'
对于第三种插件，需要指明插件的完整路径以及名称，如

Plugin 'git://git.wincent.com/command-t.git'


命令：

:BundleList -列举出列表中(.vimrc中)配置的所有插件
:BundleInstall -安装列表中全部插件
:BundleInstall! -更新列表中全部插件
:BundleSearch foo -查找foo插件
:BundleSearch! foo -刷新foo插件缓存
:BundleClean -清除列表中没有的插件
:BundleClean! -清除列表中没有的插件
