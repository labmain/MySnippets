## git cherry-pick

`git cherry-pick`可以理解为`挑拣`提交，和 merge 合并一个分支的所有提交不同的是，`它会获取某一个分支的单笔提交，并作为一个新的提交引入到你当前分支上`。当我们需要在本地合入其他分支的提交时，如果我们不想对整个分支进行合并，而是只想将某一次提交合入到本地当前分支上，那么就要使用git cherry-pick了。

## 语法
`git cherry-pick [commit-hash]`

## 使用
`commit-hash` 表示的是某次 `commit` 的 `hash` 值。现在，依次执行以下两条指令 `git cherry-pick e0bb7f3`  `git cherry-pick c9a3101`, 过程中，如果出现冲突，解决冲突后 进行`git add` ，接着执行 `git cherry-pick --continue`

## 同步多个

如果需要多个`cherry-pick`需要同步到目标分支，可以简写为`git cherry-pick <first-commit-id>...<last-commit-id>`，这是一个左开右闭的区间，也就时说 `first-commit-id`提交带来的代码的改动不会被合并过去，如果需要合并过去，可以使用`git cherry-pick <first-commit-id>^...<last-commit-id>`，它表示包含`first-commit-id`到`last-commit-id`在内的提交都会被合并过去