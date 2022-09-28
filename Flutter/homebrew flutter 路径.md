brew 安装 flutter 后，执行 which flutter 查看其 binutils 位置

```bash
$ which flutter
/usr/local/bin/flutter
```

执行 ls -F 可知其为软链（symbol link）
```bash
$ ls -F `which flutter`
/usr/local/bin/flutter@
```
进一步执行 readlink 可读取其原身位置，此即 brew 安装位置：
```bash
$ readlink `which flutter`
/usr/local/Caskroom/flutter/1.22.6/flutter/bin/flutter
```
cd 到安装目录，其实也是 flutter github 仓库：
```bash
$ cd /usr/local/Caskroom/flutter/1.22.6/flutter/
$ git remtoe -v
origin	https://github.com/flutter/flutter.git (fetch)
origin	https://github.com/flutter/flutter.git (push)
```