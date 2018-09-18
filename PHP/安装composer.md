### 安装composer

安装前需确保系统PHP版本在5.3以上,在终端中执行以下命令下载Composer可执行文件：

> curl -sS https://getcomposer.org/installer| php

此操作会下载最新版本到当前的工作目录中。然后在当前路径下就可以操作了，如查看Composer版本：

```
php composer.phar --version //Composer version 1.4.2 2017-05-17 08:17:52
```

如果下载失败也不用纠结了，直接去手动下载合适的版本[https://getcomposer.org/download/](https://getcomposer.org/download/)，结果的一样的。

这应该算是局部安装了，当跳出当前目录还是无法正常使用，这肯定不是我们所期望的。如果要想全局生效需把`composer.phar`移到系统`/usr/local/bin/`目录下：

> mv composer.phar /usr/local/bin/composer

然后在全部就可以使用`composer`,再也不用每次都输入长长的`php composer.phar`了。至此算是安装完毕。

```
//版本更新，如果有则更新到最新版本
composer selfupdate
```

更新完后会提示
`Use composer self-update --rollback to return to version 1.4.1`可以回退到上一版本。
