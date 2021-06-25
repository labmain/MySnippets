## 修改 gitlab.rb 配置文件

```
// 设置域名和端口
external_url 'http://nas.labmain.com:9000'

// 设置ssh端口(这里只是修改显示的ssh端口，实际使用的还是22！！！！)
gitlab_rails['gitlab_shell_ssh_port'] = 9022
```

**重要说明：修改端口之后，记得要修改docker的映射**

## 使用环境配置：

```
--env GITLAB_OMNIBUS_CONFIG="external_url 'http://my.domain.com:9000'; gitlab_rails['gitlab_shell_ssh_port'] = 9022;" 
```