## status
* 显示有变更的文件
```
$ git status
```

## log
* 显示当前分支的版本历史
```
$ git log
```
* 显示commit历史，以及每次commit发生变更的文件
```
$ git log --stat
```
* 显示第几条log（倒数)
```
$ git log -num
```
* 显示某个文件的版本历史，包括文件改名
```
$ git log --follow [file]
$ git whatchanged [file]
```
* 显示指定文件相关的每一次diff
```
$ git log -p [file]
```
* 显示指定文件是什么人在什么时间修改过
```
$ git blame [file]
```
* 一天内的提交；你可以给出各种时间格式，比如说具体的某一天（“2008-01-15”），或者是多久以前（“2 years 1 day 3 minutes ago”）。
```
$ git log --since=1.day
```
## diff

* 显示暂存区和工作区的差异
```
$ git diff
```
* 查看指定文件的差异  
```
$ git diff file
```
* 查看简单的diff结果   
```
$ git diff --stat
```
* 显示暂存区和上一个commit的差异
```
$ git diff --cached [file]
```
* 显示工作区与当前分支最新commit之间的差异
```
$ git diff HEAD
```
* 比较Worktree和branch之间的差异   
```
$ git diff branch
```
* 显示两次提交之间的差异
```
$ git diff [first-branch]...[second-branch]
```
* 比较两次提交之间的差异
```
$ git diff commit commit
```

## show
* 显示某次提交的元数据和内容变化
```
$ git show [commit]
```
* 显示某次提交发生变化的文件
```
$ git show --name-only [commit]
```
* 显示某次提交时，某个文件的内容
```
$ git show [commit]:[filename]
```

## reflog
* 显示当前分支的最近几次提交
```
$ git reflog
```
