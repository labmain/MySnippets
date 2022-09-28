# 创建MongoDB数据路径
```
mongod --dbpath 路径
```

# 断开MongoDB Server之间的连接
```
use admin;
db.shutdownServer()
```