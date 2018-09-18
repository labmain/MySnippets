import urllib
import urllib2
 
values={}
values['username'] = "1016903103@qq.com"
values['password']="XXXX"
data = urllib.urlencode(values) 
url = "http://passport.csdn.net/account/login"
geturl = url + "?"+data
request = urllib2.Request(geturl)
response = urllib2.urlopen(request)
print response.read()

# 你可以print geturl，打印输出一下url，发现其实就是原来的url加？然后加编码后的参数
# http://passport.csdn.net/account/login?username=1016903103%40qq.com&password=XXXX