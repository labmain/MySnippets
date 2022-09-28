1、创建索引
db.userInfo.ensureIndex({name: 1});
db.userInfo.ensureIndex({name: 1, ts: -1});
 
2、查询当前聚集集合所有索引
db.userInfo.getIndexes();
 
3、查看总索引记录大小
db.userInfo.totalIndexSize();
 
4、读取当前集合的所有index信息
db.users.reIndex();
 
5、删除指定索引
db.users.dropIndex("name_1");
 
6、删除所有索引索引
db.users.dropIndexes();

作者：巽逸
链接：https://juejin.cn/post/6844903850256629768
来源：稀土掘金
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。