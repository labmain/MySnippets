## nginx conf 配置
```bash
## 下面配置反向代理的参数
server {
    listen    8866;
    ## 1. 用户访问 http://ip:port，则反向代理到 https://github.com
    location / {
        proxy_pass  https://github.com;
        proxy_redirect     off;
        proxy_set_header   Host             $host;
        proxy_set_header   X-Real-IP        $remote_addr;
        proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
    }
    ## 2.用户访问 http://ip:port/README.md，则反向代理到
    ##   https://github.com/.../README.md
    location /README.md {
        proxy_set_header  X-Real-IP  $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass https://github.com/moonbingbing/openresty-best-practices/blob/master/README.md;
    }
}
```

## 配置说明

1. location

location 项对请求 URI 进行匹配，location 后面配置了匹配规则。例如上面的例子中，如果请求的 URI 是 localhost/，则会匹配 location / 这一项；如果请求的 URI 是 localhost/README.md，则会匹配 location /README.md 这项。

上面这个例子只是针对一个确定的 URI 做了反向代理，有的读者会有疑惑：如果对每个页面都进行这样的配置，那将会大量重复，能否做 批量 配置呢？此时需要配合使用 location 的正则匹配功能。具体实现方法可参考 Nginx 文档中 关于 location 的描述。

2. proxy_pass

proxy_pass 后面跟着一个 URL，用来将请求反向代理到 URL 参数指定的服务器上。例如我们上面例子中的 proxy_pass https://github.com，则将匹配的请求反向代理到 https://github.com。

3. proxy_set_header

默认情况下，反向代理不会转发原始请求中的 Host 头部，如果需要转发，就需要加上这句：proxy_set_header Host $host;

除了上面提到的常用配置项，还有 proxy_redirect、proxy_set_body、proxy_limit_rate 等参数，具体用法可以到Nginx 官网查看。