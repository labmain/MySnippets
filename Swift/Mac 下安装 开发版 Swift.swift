Swift 3 安装

苹果官方提供Swift3.0开发者预览版的安装包，在Mac下可直接安装，在Linux下可编译。

Mac安装

在 https://swift.org/download/#snapshots 下载Snapshot版本，直接安装即可。

验证最新的 Swift 3.0

在命令行打入如下的命令

export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"
再打命令

swift -version
显示如下则为成功

Apple Swift version 3.0-dev (LLVM cb08d1dbbd, Clang 383859a9c4, Swift 9e8266aaeb)
Target: x86_64-apple-macosx10.9
如上为验证安装，临时设置环境变量（重启会失效）。
将此添加到环境变量固定下来：

# 执行下面命令添加到环境变量文件中
echo "export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:\"\${PATH}\"" >> ~/.bash_profile

# 重新加载环境变量
source ~/.bash_profile


在 Xcode 中启

打开Xcode的 Preferences, 选择 Components > Toolchains, 选择刚才安装的swift版本.
