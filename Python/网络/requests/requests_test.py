#!/usr/bin/python

import requests

r= requests.get(url='http://www.itwhy.org')#最基本的GET请求

print(r.status_code)#获取返回状态

r = requests.get(url='http://dict.baidu.com/s', params={'wd':'python'})#带参数的GET请求

print(r.url)

print(r.text)#打印解码后的返回数据
