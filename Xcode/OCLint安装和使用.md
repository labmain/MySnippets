## 安装OCLint

OCLint是一个开源的项目，你可以通过源码安装，需要设置对应的环境变量，也可以使用作者发布的release进行安装，不过我更习惯使用`Homebrew`安装。

首先需要设置`brew`的第三方仓库`oclint/formulae`。
```
brew tap oclint/formulae
```
然后安装`OCLint`。
```
brew install oclint
```

针对对`OCLint`升级的方法:
```
brew update
brew upgrade oclint
```
使用`brew cleanup`可以清理旧版本的安装数据。
