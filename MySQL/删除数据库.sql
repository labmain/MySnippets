@>mysql -u root -p
@>密码
mysql>DELETE FROM user WHERE User=”jeecn” and Host=”localhost”;
mysql>flush privileges;
//删除用户的数据库
mysql>drop database jeecnDB;