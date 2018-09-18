在使用phpMyAdmin操作数据库时，首先需要设置mysql的root用户的密码。具体操作参考前一篇博文。设置完mysql的root密码之后，需要对phpMyAdmin的登录进行一些配置。
* 未经配置的phpMyAdmin很不安全，容易受到攻击，或者根本无法正常使用，phpMyAdmin有3种授权模式：
* cookie: 显示一个web登录页面，输入mysql的用户名和密码，然后进入管理界面 
http: 显示1个windows登录框，输入mysql的用户名和密码，然和进入管理 
* config: 把mysql用户名和密码直接填入config.inc.php，不显示登录界面，直接进入管理界面

具体的参数配置如下所示：

```php
/* Authentication type and info */
$cfg['Servers'][$i]['auth_type'] = 'config';
$cfg['Servers'][$i]['user'] = 'root';
$cfg['Servers'][$i]['password'] = '123456';
$cfg['Servers'][$i]['extension'] = 'mysql';
$cfg['Servers'][$i]['AllowNoPassword'] = true;
```

各参数的含义从命名中可以很清楚的看出来。根据自己的需要进行必要的配置即可。
