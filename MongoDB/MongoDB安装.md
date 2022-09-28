#  安装

官网教程
https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-os-x/

```
brew tap mongodb/brew 

brew install mongodb-community
```

# 检查

```
mongod -version
```

# 启动mongod服务器

作为 MacOS 服务
```
brew services start mongodb-community
```


# 手动运行为后台进程
```
mongod --config /usr/local/etc/mongod.conf --fork
```

> PS： Apple M1 为下面这个命令
```
mongod --config /opt/homebrew/etc/mongod.conf --fork
```

# 检查是否运行
```
ps aux | grep -v grep | grep mongod
```

# 关闭mongod服务器
```
brew services stop mongodb-community
```