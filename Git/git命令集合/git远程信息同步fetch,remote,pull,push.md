* 下载远程仓库的所有变动
```
$ git fetch [remote]
```
* 显示所有远程仓库
```
$ git remote -v
```
* 显示某个远程仓库的信息
```
$ git remote show [remote]
```
* 增加一个新的远程仓库，并命名
```
$ git remote add [shortname] [url]
```

## pull

* 取回远程仓库的变化，并与本地分支合并
```
$ git pull [remote] [branch]
```
`git pull origin master`   
`git pull --all` # 获取远程所有内容包括tag  
`git pull origin next:master` # 取回origin主机的next分支，与本地的master分支合并  
`git pull origin next` # 远程分支是与当前分支合并  

上面一条命令等同于下面两条命令   
`git fetch origin`  
`git merge origin/next`

## push
* 上传本地指定分支到远程仓库
```
$ git push [remote] [branch]
```
* 强行推送当前分支到远程仓库，即使有冲突
```
$ git push [remote] --force
```
1. 缩写 -f  
2. 全写--force  
3. 注：强制推送文件没有了

* 推送所有分支到远程仓库
```
$ git push [remote] --all
```
