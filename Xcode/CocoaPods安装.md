
## 快速使用

添加第三方类库的快速方法：（不更新，直接安装）
```
pod install --verbose --no-repo-update
pod update --verbose --no-repo-update
```
## 更新 本地的 pod 仓库

如果无法获取到最新版本的 框架，请运行以下命令更新本地的 pod 仓库
`pod repo update`
## 官网

https://guides.cocoapods.org/using/getting-started.html#installation

## 安装
0. 先安装更新gem
    `gem update --system`
1. 查看源
    `gem sources -l`
2. 删 除源
    `sudo gem sources -r https://rubygems.org/`
    * ruby 的软件源 https://rubygems.org 因为使用的是亚马逊的云服务，所以被墙了，需要更新一下 ruby 的源，使用如下代码将官方的 ruby 源替换成国内淘宝的源：
3. 设置源
    `sudo gem sources -a https://ruby.taobao.org` // 淘宝源已经不行啦。。。
4. 安装cocoaPad
    `sudo gem install cocoapods`
    还有一点需要注意，pod setup在执行时，会输出Setting up CocoaPods master repo，但是会等待比较久的时间。这步其实是 Cocoapods 在将它的信息下载到 ~/.cocoapods目录下，如果你等太久，可以试着 cd 到那个目录，用du -sh * 来查看下载进度。

    如果报以下错误：
    ERROR:  While executing gem ... (Errno::EPERM)
    Operation not permitted - /usr/bin/xcodeproj
    解决方案： `sudo gem install -n /usr/local/bin cocoapods`
    
    如果报错：You don't have write permissions for the /usr/bin directory.
    使用：`sudo gem install cocoapods -n /usr/local/bin`
    
5. 设置CocoaPods的镜像索引
    `pod setup`
    * 第一次执行pod setup时，CocoaPods 会将这些podspec索引文件更新到本地的 ~/.cocoapods/目录下，这个索引文件比较大，有 120M 左右。所以第一次更新时非常慢。
    * 出现Setting up CocoaPods master repo，半天没有任何反应。原因无他，因为那堵墙阻挡了cocoapods.org。。。
    * cd ~/.cocoapods里，用du -sh * 命令来查看文件大小，每隔一会看看，最终大小是190多M。

## cocoaPods使用

1. 第一次使用安装框架  
  `$ pod install`  
2. 如果想展示安装过程可以在后面添加“--verbose”命令  
   `$ pod install --verbose`  
3. 今后升级、添加、删除框架，或者框架不好用  
    `$ pod update`   
4.  搜索框架    
    `$ pod search XXX`  
5. 在项目文件夹下创建默认的 Podfile  
    `$ pod init`  
6. 忽略更新

```
pod install --verbose --no-repo-update
pod update --verbose --no-repo-update
```

## Pod file 格式说明  

1. 最低支持的 iOS 版本  
    `platform :ios, '8.0'`  
2. Swift 项目需要将框架转换为 frameworks 才能使用  
    `use_frameworks!`  
3. 框架列表  
    `pod 'AFNetworking'`  

## Gem常用命令

1. 查看gem源  
    `$ gem sources –l`  
2. gem自身升级  
    `$ sudo gem update --system`  
3. 查看版本  
    `$ gem --version`  
4. 清除过期的gem  
    `$ sudo gem cleanup`  
5. 安装包  
    `$ sudo gem install cocoapods`  
    `sudo gem install cocoapods --pre` (安装测试版本)
6. 删除包  
    `$ gem uninstall cocoapods`  
7. 更新包  
    `$ sudo gem update`  
8. 列出本地安装的包  
    `$ gem list`   
9. 更新某个gem包
    `gem update gem_name 更新某个gem包`
10. 手动修改gem源
    /Users/shun/.gemrc
    ```
    ---
    :backtrace: false
    :bulk_threshold: 1000
    :sources:
    - https://rubygems.org/
    :update_sources: true
    :verbose: true
    ```

## Podfile文件代码含义
```
pod ‘AFNetworking’              //不显式指定依赖库版本，表示每次都获取最新版本
pod ‘AFNetworking’, ‘2.0’       //只使用2.0版本
pod ‘AFNetworking’, ‘> 2.0’     //使用高于2.0的版本
pod ‘AFNetworking’, ‘>= 2.0’    //使用大于或等于2.0的版本
pod ‘AFNetworking’, ‘< 2.0’     //使用小于2.0的版本
pod ‘AFNetworking’, ‘<= 2.0’    //使用小于或等于2.0的版本
pod ‘AFNetworking’, ‘~> 0.1.2’  //使用大于等于0.1.2但小于0.2的版本
pod ‘AFNetworking’, ‘~>0.1’     //使用大于等于0.1但小于1.0的版本
pod ‘AFNetworking’, ‘~>0’       //高于0的版本，写这个限制和什么都不写是一个效果，都表示使用最新版本

# 设置工程目录相对于Podfile所在目录的相对路径
xcodeproj "./src/project_name/project_name.xcodeproj"
# 设置应用于某个或多个target的第三方库，多个target用逗号隔开
link_with 'target_name'
platform :ios
pod 'JSONKit', '~> 1.4'

#指定ios版本的第三方库，有的时候库的使用有ios版本限制
platform :ios, '7.0'
pod 'AFNetworking'

# 设置应用于某个target的第三方库
#target :'target_name' do
#pod 'JSONKit', '~> 1.4'
#end

```
