# -*- coding: UTF-8 -*-

import datetime #导入日期时间模块
today = datetime.date.today() #获得今天的日期
yesterday = today - datetime.timedelta(days=1) #用今天日期减掉时间差，参数为1天，获得昨天的日期
tomorrow = today + datetime.timedelta(days=1) #用今天日期加上时间差，参数为1天，获得明天的日期
print("昨天:%s， 今天:%s， 明天：%s" % (yesterday, today, tomorrow)) #字符串拼接在一起输出，这3天的日期