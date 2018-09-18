1、查看表
    show tables;                    # 查看数据库全部表
    select * from 表名;             # 查看表所有内容

2、创建表
    create table 表名(
        列名  类型  是否可以为空，
        列名  类型  是否可以为空
    )ENGINE=InnoDB DEFAULT CHARSET=utf8

来一个实例好详解
    CREATE TABLE `tab1` (
      `nid` int(11) NOT NULL auto_increment,                   # not null表示不能为空,auto_increment表示自增
      `name` varchar(255) DEFAULT zhangyanlin,                 # default 表示默认值
      `email` varchar(255),
      PRIMARY KEY (`nid`)                                      # 把nid列设置成主键
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

注：
默认值，创建列时可以指定默认值，当插入数据时如果未主动设置，则自动添加默认值
自增，如果为某列设置自增列，插入数据时无需设置此列，默认将自增（表中只能有一个自增列）

注意：
    1、对于自增列，必须是索引（含主键）
    2、对于自增可以设置步长和起始值
    主键，一种特殊的唯一索引，不允许有空值，如果主键使用单个列，则它的值必须唯一，如果是多列，则其组合必须唯一。

3、删除表
    drop table 表名

3、清空表内容
    delete from 表名
    truncate table 表名

4、修改表

添加列：
    alter table 表名 add 列名 类型

删除列：
    alter table 表名 drop column 列名

修改列：
    alter table 表名 modify column 列名 类型;  -- 类型
    alter table 表名 change 原列名 新列名 类型; -- 列名，类型

添加主键：
    alter table 表名 add primary key(列名);

删除主键：
    alter table 表名 drop primary key;
    alter table 表名  modify  列名 int, drop primary key;

添加外键：
    alter table 从表 add constraint 外键名称（形如：FK_从表_主表） foreign key 从表(外键字段) references 主表(主键字段);

删除外键：
    alter table 表名 drop foreign key 外键名称

修改默认值：
    ALTER TABLE testalter_tbl ALTER i SET DEFAULT 1000;
删除默认值：
    ALTER TABLE testalter_tbl ALTER i DROP DEFAULT;
