## git rebase

rebase 翻译为变基，他的作用和 merge 很相似，用于把一个分支的修改合并到当前分支上。

Assume the following history exists and the current branch is "topic":
```
        A---B---C topic
        /
D---E---F---G master
```
From this point, the result of either of the following commands:
```
git rebase master
git rebase master topic
```
would be:

                A'--B'--C' topic
                /
D---E---F---G master

### git rebase 冲突

大部分情况下，`rebase` 的过程中会产生冲突的，此时，就需要手动解决冲突，然后使用`git add` 、`git rebase --continue`的方式来处理冲突，完成 `rebase`，如果不想要某次 `rebase` 的结果，那么需要使用 `git rebase --skip`来跳过这次 `rebase`。


## git rebase 交互模式

在开发中，常会遇到在一个分支上产生了很多的无效的提交，这种情况下使用 rebase 的交互式模式可以把已经发生的多次提交压缩成一次提交，得到了一个干净的提交历史

#### 进入 交互模式
```
// 参数base-commit就是指明操作的基点提交对象
git rebase -i <base-commit>
```
此时会进入一个 vim 的交互式页面
想要合并这一堆更改，我们要使用 squash 策略进行合并，即把当前的 commit 和它的上一个 commit 内容进行合并， 大概可以表示为下面这样。
```
pick  ... ...
s     ... ... 
s     ... ... 
s     ... ... 
```
修改文件后 按下:然后wq保存退出，此时又会弹出一个编辑页面，这个页面是用来编辑提交的信息，修改为feat: 更正,最后保存一下，接着使用git branch查看提交的 commit 信息，