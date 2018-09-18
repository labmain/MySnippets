命令： use <数据库名>

例如：如果xhkdb数据库存在，尝试存取它：
   mysql> use xhkdb;
屏幕提示：Database changed

use 语句可以通告MySQL把db_name数据库作为默认（当前）数据库使用，用于后续语句。该数据库保持为默认数据库，直到语段的结尾，或者直到发布一个不同的USE语句：
   mysql> USE db1;
   mysql> SELECT COUNT(*) FROM mytable;   # selects from db1.mytable
   mysql> USE db2;
   mysql> SELECT COUNT(*) FROM mytable;   # selects from db2.mytable

使用USE语句为一个特定的当前的数据库做标记，不会阻碍您访问其它数据库中的表。下面的例子可以从db1数据库访问作者表，并从db2数据库访问编辑表：
   mysql> USE db1;
   mysql> SELECT author_name,editor_name FROM author,db2.editor
       ->        WHERE author.editor_id = db2.editor.editor_id;

USE语句被设立出来，用于与Sybase相兼容。

有些网友问到，连接以后怎么退出。其实，不用退出来，use 数据库后，使用show databases就能查询所有数据库，如果想跳到其他数据库，用
   use 其他数据库名字
就可以了。
