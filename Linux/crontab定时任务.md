## 命令

编辑配置文件
`sudo crontab -e`
选择编辑器：
`select-editor`

这里选择vim，然后编辑配置文件，做如下操作，来测试：

```
*/1 * * * * python /home/hello.py  >> /home/hello.log
*/1 * * * * date >> /home/hello.log
```

保存，重启服务：
`/etc/init.d/cron restart`


## 让Python脚本定时启动

1. 准备好定时启动的脚本auto.py
2. 用root权限编辑以下文件
`sudo vim /etc/crontab`
在文件末尾添加以下命令
`2 *   * * * root   /usr/bin/python3.5 /home/edgar/auto.py > /home/edgar/auto.log`
以上代码的意思是每隔两分钟执行一次脚本并打印日志。

## crontab编写解释

* 基本格式

```
* *  *  *  *  user command
分 时 日 月 周 用户 命令
```

* 举例说明

```
1、每分钟执行一次 
* * * * * user command
2、每隔2小时执行一次 
* */2 * * * user command (/表示频率)
3、每天8:30分执行一次
30 8 * * * user command
4、每小时的30和50分各执行一次 
30,50 * * * * user command（,表示并列）
4、每个月的3号到6号的8:30执行一次
30 8 3-6 * * user command （-表示范围）
5、每个星期一的8:30执行一次
30 8 * * 1 user command （周的范围为0-7,0和7代表周日）
```





### 20个超实用的Crontab使用实例

* * *

1. 每天 02:00 执行任务

```
0 2 * * * /bin/sh backup.sh

```

2. 每天 5:00和17:00执行任务

```
0 5,17 * * * /scripts/script.sh

```

3. 每分钟执行一次任务

    通常情况下，我们并没有每分钟都需要执行的脚本(默默的想到了12306--)

```
  * * * * *  /scripts/script.sh

```

4. 每周日 17:00 执行任务

```
0 17 * * sun  /scripts/script.sh

```

5. 每 10min 执行一次任务

```
*/10 * * * * /scripts/monitor.sh

```

6. 在特定的某几个月执行任务

```
  * * * jan,may,aug * /script/script.sh

```

7. 在特定的某几天执行任务

```
0 17 * * sun,fri /script/scripy.sh

```

在每周五、周日的17点执行任务

8. 在某个月的第一个周日执行任务

```
0 2 * * sun  [ $(date +%d) -le 07 ] && /script/script.sh

```

9. 每四个小时执行一个任务

```
0 */4 * * * /scripts/script.sh

```

10. 每周一、周日执行任务

```
0 4,17 * * sun,mon /scripts/script.sh

```

11. 每个30秒执行一次任务

    我们没有办法直接通过上诉类似的例子去执行，因为最小的是1min。但是我们可以通过如下的方法。

```
  * * * * * /scripts/script.sh
  * * * * *  sleep 30; /scripts/script.sh

```

12. 多个任务在一条命令中配置

```
  * * * * * /scripts/script.sh; /scripts/scrit2.sh

```

13. 每年执行一次任务

```
@yearly /scripts/script.sh

```

@yearly 类似于“0 0 1 1 *”。它会在每年的第一分钟内执行，通常我们可以用这个发送新年的问候。

14. 每月执行一次任务

```
@yearly /scripts/script.sh

```

15. 每周执行一次任务

```
@yearly /scripts/script.sh

```

16. 每天执行一次任务

```
@yearly /scripts/script.sh

```

17. 每分钟执行一次任务

```
@yearly /scripts/script.sh

```

18. 系统重启时执行

```
@reboot /scripts/script.sh

```

19. 将 Cron 结果重定向的特定的账户

    默认情况下，cron 只会将结果详情发送给 cron 被制定的用户。如果需要发送给其他用户，可以通过如下的方式：

```
  # crontab -l
  MAIL=bob
  0 2 * * * /script/backup.sh

```

20. 将所有的 cron 命令备份到文本文件当中

    这是一个当我们丢失了cron命令后方便快速的一个恢复方式。

    下面是利用这个方式恢复cron的一个小例子。（看看就行~）

    首先：检查当前的cron

```
# crontab -l
MAIL=rahul
0 2 * * * /script/backup.sh

```

然后：备份cron到文件中

```
# crontab -l > cron-backup.txt
# cat cron-backup.txt
MAIL=rahul
0 2 * * * /script/backup.sh

```

接着：移除当前的cron

```
# crontab -r
# crontab -l
no crontab for root

```

恢复：从text file中恢复

```
# crontab cron-backup.txt
# crontab -l
MAIL=rahul
0 2 * * * /script/backup.sh
```


