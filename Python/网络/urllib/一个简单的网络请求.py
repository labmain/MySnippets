#!/usr/bin/python
# -*- coding: utf-8 -*-

import urllib2

request = urllib2.Request("http://www.baidu.com")
response = urllib2.urlopen(request)
# urlopen一般接受三个参数，它的参数如下：
# urlopen(url, data, timeout)
# 第一个参数url即为URL，第二个参数data是访问URL时要传送的数据，第三个timeout是设置超时时间。
# 第二三个参数是可以不传送的，data默认为空None，timeout默认为 socket._GLOBAL_DEFAULT_TIMEOUT

# response = urllib2.urlopen('http://www.baidu.com', timeout=10)
# response = urllib2.urlopen('http://www.baidu.com',data, 10)
# 如果第二个参数data为空那么要特别指定是timeout是多少，写明形参，如果data已经传入，则不必声明。

# 第一个参数URL是必须要传送的，在这个例子里面我们传送了百度的URL，执行urlopen方法之后，返回一个response对象，返回信息便保存在这里面。
print response.read()
# response对象有一个read方法，可以返回获取到的网页内容。
