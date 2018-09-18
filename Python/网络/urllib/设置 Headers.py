import urllib  
import urllib2  

url = 'http://www.server.com/login'
user_agent = 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)'  
values = {'username' : 'cqc',  'password' : 'XXXX' }  
headers = { 'User-Agent' : user_agent }  
data = urllib.urlencode(values)  
request = urllib2.Request(url, data, headers)  
response = urllib2.urlopen(request)  
page = response.read() 


# 这样，我们设置了一个headers，在构建request时传入，在请求时，就加入了headers传送，服务器若识别了是浏览器发来的请求，就会得到响应。

# 另外，我们还有对付”反盗链”的方式，对付防盗链，服务器会识别headers中的referer是不是它自己，如果不是，有的服务器不会响应，所以我们还可以在headers中加入referer

# 例如我们可以构建下面的headers
headers = { 'User-Agent' : 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)'  ,
                        'Referer':'http://www.zhihu.com/articles' }  
# 同上面的方法，在传送请求时把headers传入Request参数里，这样就能应付防盗链了。

# 另外headers的一些属性，下面的需要特别注意一下：

# User-Agent : 有些服务器或 Proxy 会通过该值来判断是否是浏览器发出的请求
# Content-Type : 在使用 REST 接口时，服务器会检查该值，用来确定 HTTP Body 中的内容该怎样解析。
# application/xml ： 在 XML RPC，如 RESTful/SOAP 调用时使用
# application/json ： 在 JSON RPC 调用时使用
# application/x-www-form-urlencoded ： 浏览器提交 Web 表单时使用
# 在使用服务器提供的 RESTful 或 SOAP 服务时， Content-Type 设置错误会导致服务器拒绝服务

# 其他的有必要的可以审查浏览器的headers内容，在构建时写入同样的数据即可。