下载

下载压缩包： [https://swift.org/download/](https://swift.org/download/)

$ cd ~/Download/swift
# 解压缩
$ tar zxvf swift-DEVELOPMENT-SNAPSHOT-2016-02-25-a-ubuntu14.04.tar.gz


// 当前会话，环境变量生效
export PATH=/home/Download/swift-DEVELOPMENT-SNAPSHOT-2016-08-04-a-ubuntu14.04/usr/bin:${PATH}

// 全局生效
sudo vim ~/.bashrc
在文件最后一行添加：
export PATH=/home/Download/swift-DEVELOPMENT-SNAPSHOT-2016-08-04-a-ubuntu15.10/usr/bin:${PATH}