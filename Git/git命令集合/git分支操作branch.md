## branch
* 列出所有本地分支
```
$ git branch
```
* 列出所有远程分支
```
$ git branch -r
```
* 列出所有本地分支和远程分支
```
$ git branch -a
```
* 新建一个分支，但依然停留在当前分支
```
$ git branch [branch-name]
```
* 新建一个分支，并切换到该分支
```
$ git checkout -b [branch]
```
* 新建一个分支，指向指定commit
```
$ git branch [branch] [commit]
```
* 新建一个分支，与指定的远程分支建立追踪关系
```
$ git branch --track [branch] [remote-branch]
```
* 重命名分支
```
$ git branch -m old new
```
* 建立追踪关系，在现有分支与指定的远程分支之间
```
$ git branch --set-upstream [branch] [remote-branch]
```
* 选择一个commit，合并进当前分支
```
$ git cherry-pick [commit]
```
* 删除分支
```
$ git branch -d [branch-name]
```
* 删除远程分支
```
$ git push origin --delete [branch-name]
$ git branch -dr [remote/branch]
```
## merge
* 合并指定分支到当前分支
```
$ git merge [branch]
```
## checkout

* 切换到指定分支，并更新工作区
```
$ git checkout [branch-name]
```
