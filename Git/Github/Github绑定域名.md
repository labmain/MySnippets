1. 向你的 Github Pages 仓库添加一个CNAME(一定要*大写*)文件

其中只能包含一个顶级域名，像这样：
example.com

如果你是用 hexo 框架搭建博客并部署到 Github Pages 上，每次

> hexo g  
> hexo d  

后会把你的博客所在目录下 public 文件夹里的东西都推到 Github Pages 仓库上，并且把 CNAME 文件覆盖掉，解决这个问题可以直接把 CNAME 文件添加到 public 文件夹里，这样每次推的时候就不用担心仓库里的 CNAME 文件被覆盖掉了。


2. 向你的 DNS 配置中添加 3 条记录

```
@        A        192.30.252.153
@        A        192.30.252.154
www      CNAME    username.github.io.
用你自己的 Github 用户名替换 username
```

推荐使用 DNSPOD 的服务，使用国外的 DNS 解析服务可能有被墙的风险。

至于如何使用 DNSPOD 解析域名，参考
http://jingyan.baidu.com/article/546ae1857c4ee81149f28cbe.html


3. 等待你的 DNS 配置生效

对DNS的配置不是立即生效的，过10分钟再去访问你的域名看看有没有配置成功 : )
