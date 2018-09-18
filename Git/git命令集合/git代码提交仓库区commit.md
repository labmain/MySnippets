* 提交暂存区到仓库区
```
$ git commit -m [message]
```
* 提交暂存区的指定文件到仓库区
```
$ git commit [file1] [file2] ... -m [message]
```
* 提交工作区自上次commit之后的变化，直接到仓库区
```
$ git commit -a
```
* 提交时显示所有diff信息
```
$ git commit -v
```
* 使用一次新的commit，替代上一次提交,如果代码没有任何新变化，则用来改写上一次commit的提交信息
```
$ git commit --amend -m [message]
```
* 重做上一次commit，并包括指定文件的新变化
`$ git commit --amend [file1] [file2] ...`
