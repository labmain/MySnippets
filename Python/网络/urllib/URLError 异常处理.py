#!/usr/bin/python
# -*- coding: utf-8 -*-

import urllib2

requset = urllib2.Request('http://www.xxxxx.com')
try:
    urllib2.urlopen(requset)
except urllib2.URLError, e:
    print e.reason
    
# HTTPError实例产生后会有一个code属性，这就是是服务器发送的相关错误号。
# 因为urllib2可以为你处理重定向，也就是3开头的代号可以被处理，并且100-299范围的号码指示成功，所以你只能看到400-599的错误号码。
# 
# 下面我们写一个例子来感受一下，捕获的异常是HTTPError，它会带有一个code属性，就是错误代号，另外我们又打印了reason属性，这是它的父类URLError的属性。

req = urllib2.Request('http://blog.csdn.net/cqcre')
try:
    urllib2.urlopen(req)
except urllib2.HTTPError, e:
    print e.code
    print e.reason
    



# 最终的写法：

import urllib2

req = urllib2.Request('http://blog.csdn.net/cqcre')
try:
    urllib2.urlopen(req)
except urllib2.URLError, e:
    if hasattr(e,"code"):
        print e.code
    if hasattr(e,"reason"):
        print e.reason
else:
    print "OK"