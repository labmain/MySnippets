1、增
    insert into 表 (列名,列名...) values (值,值,...)
    insert into 表 (列名,列名...) values (值,值,...),(值,值,值...)
    insert into 表 (列名,列名...) select (列名,列名...) from 表

例：
    insert into tab1(name,email) values('zhangyanlin','zhangyanlin8851@163.com')

2、删
    delete from 表                                      # 删除表里全部数据
    delete from 表 where id＝1 and name＝'zhangyanlin'   # 删除ID =1 和name='zhangyanlin' 那一行数据

3、改
    update 表 set name ＝ 'zhangyanlin' where id>1
    update 表 set Address = 'Zhongshan 23', City = 'Nanjing' where LastName = 'Wilson'

4、查
    select * from 表
    select * from 表 where id > 1
    select nid,name,gender as gg from 表 where id > 1

a、条件判断where
    select * from 表 where id > 1 and name != 'aylin' and num = 12;
    select * from 表 where id between 5 and 16;
    select * from 表 where id in (11,22,33)
    select * from 表 where id not in (11,22,33)
    select * from 表 where id in (select nid from 表)

b、通配符like
    select * from 表 where name like 'zhang%'  # zhang开头的所有（多个字符串）
    select * from 表 where name like 'zhang_'  # zhang开头的所有（一个字符）

c、限制limit
    select * from 表 limit 5;            - 前5行
    select * from 表 limit 4,5;          - 从第4行开始的5行
    select * from 表 limit 5 offset 4    - 从第4行开始的5行

d、排序asc，desc
    select * from 表 order by 列 asc              - 根据 “列” 从小到大排列
    select * from 表 order by 列 desc             - 根据 “列” 从大到小排列
    select * from 表 order by 列1 desc,列2 asc    - 根据 “列1” 从大到小排列，如果相同则按列2从小到大排序
e、分组group by

    select num from 表 group by num
    select num,nid from 表 group by num,nid
    select num,nid from 表  where nid > 10 group by num,nid order nid desc
    select num,nid,count(*),sum(score),max(score),min(score) from 表 group by num,nid
    select num from 表 group by num having max(id) > 10

特别的：group by 必须在where之后，order by之前
