## add

* 添加指定文件到暂存区
```
$ git add [file2] [file2] ...
```
* 添加指定目录到暂存区，包括子目录
```
$ git add [dir]
```
* 添加当前目录的所有文件到暂存区
```
$ git add .
```

## rm

* 删除工作区文件，并且将这次删除放入暂存区
```
$ git rm [file1] [file2] ...
```
* 停止追踪指定文件，但该文件会保留在工作区
```
$ git rm --cached [file]
```
* 改名文件，并且将这个改名放入暂存区
```
$ git mv [file-original] [file-renamed]
```
