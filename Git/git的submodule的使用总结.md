### 添加submodule

```git
git submodule add https://github.com/phpgao/BaiduSubmit.git usr/plugins/BaiduSubmit

git submodule add https://github.com/phpgao/TableOfContents.git usr/plugins/TableOfContents

git submodule add https://github.com/phpgao/ExternalTool.git usr/plugins/ExternalTool

git submodule add https://github.com/phpgao/CdnHelper usr/plugins/CdnHelper
这个时候如果你留意一下.gitmodules和.git/config这两个文件，应该会发现相关信息已被记录下来！
```

### 如何更新submodule

当clone项目时有子模块存在时，第一次是不会顺便clone出子模块的，需要执行一些命令：

```git
git clone xxx.git

# 初始化子模块
git submodule init

# 将子模块的文件check出来
git submodule update

# 现在所有子模块已经把被checkout到本地，是不是很棒！
```

### 如何删除submodule

但是，如何删除submodule呢？大家第一时间一定想到的是remove，但是git貌似没有提供类似 git submodule remove 那么easy的方法，所以我们要借助deinit。所以如果之前你是直接编辑.gitmodules文件就以为删除了那你就错了！

```git
# 我们以BaiduSubmit为例，之前我们添加在了 usr/plugins/BaiduSubmit
# 首先我们反初始化
git submodule deinit usr/plugins/BaiduSubmit

# 此时 .git/config 已被重写，BaiduSubmit的相关信息已经不存在了
git rm usr/plugins/BaiduSubmit
# 这时，子模块文件被删除，同时 .gitmodules 文件中的相关信息被删除

# 还有一种情况，就是子模块刚被add，但是还没有commit的时候，这时如果反悔了，但是还想保留工作现场，可以这样。
# 如果不想保留，看下一条
git rm --cached usr/plugins/BaiduSubmit
rm -rf .git/modules/usr/plugins/BaiduSubmit

# 或者直接全部删除
git submodule deinit --force usr/plugins/BaiduSubmit

```

### 删除其中一个 submodule

1. 编辑.gitmodules,删除对应要删除的submodule的行．
2. 编辑.git/config,删除有对应要删除的submodule的行．
3. 删除对应的目录:
    rm -rf bundle/xxxx

### 如何修改并提交submodule

这里分两种情况，一个是本人直接在子项目修改并提交，另一种是别人的git仓库被修改

* 第一种情况

其实我们只需要注意一点，就是子模块的分支出于游离状态，我们在修改他的时候第一步需要执行检出对应的分支即可！

```git
# 首先，我们进入子模块
cd xx/xx/sub

# 检出master分支
git checkout master

# 然后做修改
vim some-file.py

# 最后做提交
git add .
git commit -m "Get something done"
git push origin master
```

* 第二种情况

当子模块是别人维护的时候，当他更新的时候，我们需要怎么做？

```git
# 首先检出master分支
git checkout master

# 然后拉取更新
git pull

# 回到父项目中更新

cd ../../

git add xx/xx/xx
git commit -m "update submodule"
```

### 如何将submodule的变更在父项目中提交

子模块被提交后父项目会检测到，正常提交即可！

```git
git status

# modified:   xx/xxxx/xxxx (new commits)

# add的时候注意再最后不要加 / 斜杠，否则会出现很棘手问题

git add xx/xxxx/xxxx
git commit -m "update submodule"
git push
```
