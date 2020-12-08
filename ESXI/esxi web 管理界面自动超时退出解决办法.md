1.登录Host Client Web Interface 

esxi65removetimeout01

2.选择管理--系统--高级设置--搜索timeout关键字  选择UserVars.HostClientSessionTimeout. 可见默认值为900s 也就是15min

esxi65removetimeout04

3.选择编辑按钮，根据具体情况编辑即可。如果想永不超时退出，设置为0即可。不过考虑到安全影响，尽量不要设置为0.

