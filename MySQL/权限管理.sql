说明：
对于数据库及内部其他权限：
    数据库名.*           数据库中的所有
    数据库名.表          指定数据库中的某张表
    数据库名.存储过程     指定数据库中的存储过程
    *.*                所有数据库
对于用户和IP的权限：
    用户名@IP地址         用户只能在改IP下才能访问
    用户名@192.168.1.%   用户只能在改IP段下才能访问(通配符%表示任意)
    用户名@%             用户可以再任意IP下访问(默认IP地址为%)


权限问题
1. 查看权限
    show grants for '用户'@'IP地址'
2. 授权
    grant  权限 on 数据库.表 to   '用户'@'IP地址'
3. 取消授权
    revoke 权限 on 数据库.表 from '用户'@'IP地址'

授权实例：
    grant all privileges on db1.tb1 TO '用户名'@'IP'
    grant select on db1.* TO '用户名'@'IP'
    grant select,insert on *.* TO '用户名'@'IP'
    revoke select on db1.tb1 from '用户名'@'IP'


//授权jeecn用户拥有jeecn数据库的所有权限
@>grant all  on jeecnDB.* to jeecn@localhost identified by ‘jeecn’;

//如果想指定部分权限给一用户，可以这样来写:
mysql>grant select,update on jeecnDB.* to jeecn@localhost identified by 'jeecn';
mysql> grant 权限1,权限2,…权限n on 数据库名称.表名称 to 用户名@用户地址 identified by ‘连接口令’;

//刷新系统权限表。
mysql>flush privileges;
