1.安装
brew install mysql
brew link mysql

2.启动、关闭、重启
mysql.server start/stop/restart

2.链接
swift build -Xswiftc -I/usr/local/include/mysql -Xlinker -L/usr/local/lib

swift package generate-xcodeproj -Xswiftc -I/usr/local/include/mysql -Xlinker -L/usr/local/lib

