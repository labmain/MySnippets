# 1、mongodb数据库用户角色
#数据库用户角色
read：允许用户读取指定数据库
readWrite：允许用户读写指定数据库
 
#数据库管理员角色
dbAdmin：允许用户进行索引创建、删除，查看统计或访问system.profile，但没有角色和用户管理的权限
userAdmin：提供了在当前数据库中创建和修改角色和用户的能力
dbOwner： 提供对数据库执行任何管理操作的能力。这个角色组合了readWrite、dbAdmin和userAdmin角色授予的特权。
 
#集群管理角色
clusterAdmin ： 提供最强大的集群管理访问。组合clusterManager、clusterMonitor和hostManager角色的能力。还提供了dropDatabase操作
clusterManager ： 在集群上提供管理和监视操作。可以访问配置和本地数据库，这些数据库分别用于分片和复制
clusterMonitor ： 提供对监控工具的只读访问，例如MongoDB云管理器和Ops管理器监控代理。
hostManager ： 提供监视和管理服务器的能力。
 
#备份恢复角色
backup ： 提供备份数据所需的能力，使用MongoDB云管理器备份代理、Ops管理器备份代理或使用mongodump
restore ： 提供使用mongorestore恢复数据所需的能力
 
#所有数据库角色
readAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的读权限
readWriteAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的读写权限
userAdminAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的userAdmin权限
dbAdminAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的dbAdmin权限。
 
#超级用户角色
root：提供对readWriteAnyDatabase、dbAdminAnyDatabase、userAdminAnyDatabase、clusterAdmin、restore和backup的所有资源的访问

# 2、创建用户
#创建超级管理员
use admin
db.createUser({
    user:"admin",
    pwd:"123456",
    roles:[{
        role:"root",
        db:"admin"
    }]
})
 
#创建普通用户
#创建test用户，密码为123456，权限为testDB数据库的readWrite权限
use testDB #进入testDB数据库
db.createUser({user:'test',pwd:'123456',roles:[{role:'readWrite',db:'testDB'}]})
 
#修改密码
db.updateUser('test',{user:'test',pwd:'admin',roles:[{role:'read',db:'testDB'}]})  //修改密码 并且 //修改角色为只读

# 3、常用的用户命令
#添加一个用户
db.addUser("name");
db.addUser("userName", "pwd123", true); 添加用户、设置密码、是否只读
 
#数据库认证、安全模式
db.auth("userName", "123123");
 
#查看所有用户
 show users;
#删除用户
 db.removeUser("test")