# 1、常用基本操作
```
show dbs                                :查看数据库列表;
db                                      :查看当前数据库;
db.createCollection('要新建的表名')       :新建一个表;
show collections                        :查看当前数据库下的表;
db.表名.drop()                           :删除当前数据库指定表
db.dropDatabase()                       :删除当前数据库
show users                              ：查看当前库的所有用户
db.dropDatabase()                       ：删除当前使用数据库
db.cloneDatabase(“127.0.0.1”)           ：将指定机器上的数据库的数据克隆到当前数据库
db.copyDatabase("mydb", "temp", "127.0.0.1")：将本机的mydb的数据复制到temp数据库中
db.repairDatabase()                     ：修复当前数据库
db.getName()                            ：查看当前使用的数据库
db.stats()                              ：显示当前db状态
db.version()                            ：当前db版本
db.getMongo()                           ：查看当前db的链接机器地址
 
db.serverStatus().connections.current   ：查看当前的连接数
```

# 2、Collection聚集集合（表）
```d
b.createCollection(“collName”, {size: 20, capped: 5, max: 100});创建一个聚集集合（table）
db.getCollection("account");得到指定名称的聚集集合（table）
db.getCollectionNames();得到当前db的所有聚集集合
db.printCollectionStats();显示当前db所有聚集索引的状态
 ```
  
## 查看聚集集合基本信息
```
1、查看帮助 
db.yourColl.help();
2、查询当前集合的数据条数 
db.yourColl.count();
3、查看数据空间大小
db.userInfo.dataSize();
4、得到当前聚集集合所在的db
db.userInfo.getDB();
5、得到当前聚集的状态
db.userInfo.stats();
6、得到聚集集合总大小
db.userInfo.totalSize();
7、聚集集合储存空间大小
db.userInfo.storageSize();
8、Shard版本信息 
db.userInfo.getShardVersion()
9、聚集集合重命名
db.userInfo.renameCollection("users"); 将userInfo重命名为users
10、删除当前聚集集合
db.userInfo.drop();
```
### 3、数据的增删改查操作

#### 增：
```
1、插入一条数据
db.表名.insert(数据);
db.test1.insertOne(数据); #insertOne只能插入1条数据
 
2、插入多条数据
db.表名.insert([数据1,数据2]);
db.表名.insertMany([数据1,数据2]);
 
方法二、save
db.表名.save(数据);
 
insert与save区别：
当默认的“_id”值已存在时，调用insert方法插入会报错；而save方法不会,会更新相同的_id所在行数据的信息
```
 
 
#### 删
```
db.表名.remove(条件); #默认只删除第1条符合条件的数据
db.表名.deleteOne(条件)
 

#删除所有符合条件的数据
db.表名.deleteMany(条件)
``` 
 
 
#### 改
```
db.表名.update({"条件字段名":"字段值"},{$set:{"要修改的字段名":"修改后的字段值"}});

```
#修改一条数据updateOne
db.inventory.updateOne(
   { item: "paper" },
   {
     $set: { "size.uom": "cm", status: "P" },
     $currentDate: { lastModified: true }
   }
)
 
#修改多条数据updateMany
db.inventory.updateMany(
   { "qty": { $lt: 50 } },
   {
     $set: { "size.uom": "in", status: "P" },
     $currentDate: { lastModified: true }
   }
)
 
#替换replaceOne
db.inventory.replaceOne(
   { item: "paper" },
   { item: "paper", instock: [ { warehouse: "A", qty: 60 }, { warehouse: "B", qty: 40 } ] }
)
 
#### 查
db.表名.find():查询表中所有数据
db.表名.find(条件):按条件查询
db.表名.findOne(条件):查询第一条(支持条件)
db.表名.find().limit(数量):限制数量(分页)
db.表名.find().skip(数量):跳过指定数量
db.表名.find().skip(起始数量).limit(显示的数量) :如：显示从10开始的10条数据
