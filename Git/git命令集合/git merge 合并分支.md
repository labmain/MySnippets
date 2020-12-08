# git merge 命令

git merge命令用于将两个或两个以上的开发历史加入(合并)一起。

## 语法
```bash
git merge [-n] [--stat] [--no-commit] [--squash] [--[no-]edit]
    [-s <strategy>] [-X <strategy-option>] [-S[<keyid>]]
    [--[no-]allow-unrelated-histories]
    [--[no-]rerere-autoupdate] [-m <msg>] [<commit>…​]
git merge --abort
git merge --continue

```
## 描述

将来自命名提交的更改(从其历史从当前分支转移到当前分支之后)。 该命令由`git pull`用于合并来自另一个存储库的更改，可以手动使用将更改从一个分支合并到另一个分支。

## git merge —squash **不保留历史提交**

本地文件内容与不使用该选项的合并结果相同，但是不提交、不移动HEAD，因此需要一条额外的commit命令。其效果相当于将another分支上的多个commit合并成一个，放在当前分支上，原来的commit历史则没有拿过来。
判断是否使用--squash选项最根本的标准是，待合并分支上的历史是否有意义。

```
git merge --squash develop
git commit -m "信息"
git push origin master
```

##  git merge –no-ff **保留所有提交信息**

`git merge –no-ff` 可以保存你之前的分支历史。能够更好的查看`merge`历史，以及`branch`状态。
`git merge`则不会显示 `feature`，只保留单条分支记录。
