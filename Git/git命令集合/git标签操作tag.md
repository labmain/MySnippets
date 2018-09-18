
* 列出所有tag
```
$ git tag
```
* 新建一个tag在当前commit
```
$ git tag [tag]
```
* 新建一个tag在指定commit
```
$ git tag [tag] [commit]
```
* 删除本地tag
```
$ git tag -d [tag]
```
* 删除远程tag
```
$ git push origin :refs/tags/[tagName]
```
* 查看tag信息
```
$ git show [tag]
```
* 提交指定tag
```
$ git push [remote] [tag]
```
* 提交所有tag
```
$ git push [remote] --tags
```
* 新建一个分支，指向某个tag
```
$ git checkout -b [branch] [tag]
```
