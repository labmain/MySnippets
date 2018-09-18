--查询所有数据
select * from Info 查所有数据
select Code,Name from Info 查特定列

--根据条件查
select * from Info where Code='p001' 一个条件查询
select * from Info where Code='p001' and Nation='n001' 多条件 并关系 查询
select * from Info where Name='胡军' or Nation='n001' 多条件 或关系 查询
select * from Car where Price>=50 and Price<=60 范围查询
select * from Car where Price between 50 and 60 范围查询

--模糊查询
select * from Car where Name like '%型' %通配符代表任意多个字符
select * from Car where Name like '%奥迪%' _通配符代表任意一个字符
select * from Car where Name like '_马%'

--排序
select * from Car order by Price asc 按照价格升序排列
select * from Car order by Price desc 按照价格降序排列
select * from Car order by Price,Oil 按照两列进行排序，前面的为主要的

--统计函数（聚合函数）
select count(Code) from Car 查询表中有多少条数据
select max(Price) from Car 取价格的最大值
select min(Price) from Car 取价格的最小值
select sum(Price) from Car 取价格的总和
select avg(Price) from Car 取价格的平均值

--分组查询
select Brand from Car group by Brand having count(*)>2 查询所有系列中数量大于2的

--分页查询
select * from Car limit 0,5 跳过几条数据取几条数据

--去重查询
select distinct Brand from Car

--查询一个表的有多少行，多少条记录
SELECT COUNT(*) FROM test;
