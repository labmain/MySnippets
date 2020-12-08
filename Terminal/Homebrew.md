## 安装

[官网](https://brew.sh/)

在终端里运行下面这句
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

```

## 获取最新版本

`brew update`

> 注意：如果遇到Error: The /usr/local directory is not writable.错误，就执行以下命令sudo chown -R $(whoami):admin /usr/local，再更新。

## Homebrew 其它命令

```
brew install git // 使用brew安装软件
brew uninstall wget // 使用brew卸载软件
brew search /wge*/  // 使用brew查询软件，其中/wge*/是个正则brew search表达式，需要包含在/中
brew list  // 列出已安装的软件
brew home   // 用浏览器打开brew的官方网站
brew info   // 显示软件信息
brew deps   // 显示包依赖
```

## HomeBrew 安装 App

```
brew cask install iterm2
```