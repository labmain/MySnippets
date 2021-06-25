在Mysql中其实有一个内置且名为mysql的数据库，这个数据库中存储的是Mysql的一些数据，比如用户、权限信息、存储过程等，所以呢，我们可以通过如下简单的查询语句来显示所有的用户呢。

SELECT user FROM mysql.user;