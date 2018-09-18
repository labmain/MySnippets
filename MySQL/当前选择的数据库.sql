命令：mysql> select database();

MySQL中SELECT命令类似于其他编程语言里的print或者write，你可以用它来显示一个字符串、数字、数学表达式的结果等等。如何使用MySQL中SELECT命令的特殊功能？

1.显示MYSQL的版本
mysql> select version();
+-----------------------+
| version()             |
+-----------------------+
| 6.0.4-alpha-community |
+-----------------------+
1 row in set (0.02 sec) 

2. 显示当前时间
mysql> select now();
+---------------------+
| now()               |
+---------------------+
| 2009-09-15 22:35:32 |
+---------------------+
1 row in set (0.04 sec)

3. 显示年月日
SELECT DAYOFMONTH(CURRENT_DATE);
+--------------------------+
| DAYOFMONTH(CURRENT_DATE) |
+--------------------------+
|                       15 |
+--------------------------+
1 row in set (0.01 sec)

SELECT MONTH(CURRENT_DATE);
+---------------------+
| MONTH(CURRENT_DATE) |
+---------------------+
|                   9 |
+---------------------+
1 row in set (0.00 sec)

SELECT YEAR(CURRENT_DATE);
+--------------------+
| YEAR(CURRENT_DATE) |
+--------------------+
|               2009 |
+--------------------+
1 row in set (0.00 sec)

4. 显示字符串
mysql> SELECT "welecome to my blog!";
+----------------------+
| welecome to my blog! |
+----------------------+
| welecome to my blog! |
+----------------------+
1 row in set (0.00 sec)

5. 当计算器用
select ((4 * 4) / 10 ) + 25;
+----------------------+
| ((4 * 4) / 10 ) + 25 |
+----------------------+
|                26.60 |
+----------------------+
1 row in set (0.00 sec)

6. 串接字符串
select CONCAT(f_name, " ", l_name)
AS Name
from employee_data
where title = 'Marketing Executive';
+---------------+
| Name          |
+---------------+
| Monica Sehgal |
| Hal Simlai    |
| Joseph Irvine |
+---------------+
3 rows in set (0.00 sec)
注意：这里用到CONCAT()函数，用来把字符串串接起来。另外，我们还用到以前学到的AS给结果列'CONCAT(f_name, " ", l_name)'起了个假名。
