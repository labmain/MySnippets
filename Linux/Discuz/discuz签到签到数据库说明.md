签到数据存储在 pre_fx_checkin表里

uid：论坛uid
days：累计签到天数
time：unix时间戳 为最后一次签到时间
constant：签到天数
up：比较前一天名词变化
level：不明
todayrank:不明


例子：

修改liuhe的签到天数

使用服务器桌面navicat打开mysql—nanyei数据库—点开 pre_fx_checkin表

liuhe的UID是4，找到对应的一列，修改constant为80，并且修改time最后一次签到时间，然后到论坛后台，找到插件，重新计算排名即可。
