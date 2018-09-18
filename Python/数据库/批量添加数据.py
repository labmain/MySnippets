#!/usr/bin/python
import sqlite3

# 如果执行失败，应该是中文名字的问题

# 打开数据库
con = sqlite3.connect('/Users/shun/Data/toeflWord-DEMO/toeflWord/Base/DataModel/word.sqlite')

# 获取游标
cur = con.cursor()
def insetNewWord(num):
    sql = "INSERT INTO versions ('id', 'word', 'frequency', 'subject', 'content') VALUES ('%s', 'abandon', 'normal', '10', 'content')" % num
    # 执行sql语句
    cur.execute(sql)
    # 提交更改
    con.commit()

for num in range(6000):
    insetNewWord(num)
    print num
