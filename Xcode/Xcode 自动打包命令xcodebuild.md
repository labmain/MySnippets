http://fight4j.github.io/2016/11/21/xcodebuild/

## 自动脚本打包

要把工程打包IPA，总共分几步？两步！

`xcodebuild archive`
`xcodebuild -exportArchive -archivePath xcarchivepath -exportPath destinationpath -exportOptionsPlist path`
当然要根据实际情况加上`-project, -configuration, -archivePath`等参数，还可以搭配给力的`xcpretty`：

`xcodebuild archive -workspace /Path/To/Workspace/Demo.xcworkspace -scheme DemoScheme -configuration Release -archivePath /Path/To/Archive/Demo.xcarchive | xcpretty`

第二条命令`xcodebuild -exportArchive`的`-archivePath -exportPath -exportOptionsPlist`三个选项很容易理解，其中`-exportOptionsPlist`替换了以前的`-exportSigningIdentity -exportSigningIdentity`等选项。这部分改动在官方文档中还未更新，当然在man文档中早有体现，`-exportOptionsPlist`要求指定一个`plist`文件作为配置文件，下面列举几个常用的key值：

```
method : String
         Describes how Xcode should export the archive. Available options: app-store, ad-hoc, package, enterprise, development, and developer-id. The list of options varies based on the type of archive. Defaults to development.  		
teamID : String
         The Developer Portal team to use for this export. Defaults to the team used to build the archive.
```

对应到具体的需求，我的`plist`里就只指定了这两个键值对，其中`method`选择`enterprise`(其他发布方式对应选择即可)，`teamID`选择对应值。这两个选项也对应了在Xcode中手动arhive并导出包时要点选的两个动作。

Xcode8中的设置

`Xcode`近年来致力于自动管理开发证书，每个大版本都会有修改(有方便的地方也有坑的地方)。到了`Xcode8`，在`target`的`General`设置面板中直接新增了`Signing`，看得出来，`Automatically manage signing`选项是苹果推荐的签名方式。如果恰巧不幸，你的证书里的`App ID`与`Xcode`中的`bundle ID`不符(比如我的企业证书中的App ID带有通配符)，就应该关闭该选项，手动为某个`configuration`指定打包证书。不要忘记在`-exportOptionsPlist`指定的`plist`中配置对应的`teamID`，否则在`xcodebuild -exportArchive`时会报团队不匹配的错误。


## xcodebulid 命令

清理命令：
xcodebuild clean \
-configuration Debug  -quiet  || exit

编译工程命令：
xcodebuild archive \
-workspace /Users/shun/Data/gre3000/gre3K.xcworkspace \
-scheme gre3000 \
-configuration Debug \
-archivePath /Users/shun/Data/build/gre3K.xcarchive -quiet || exit

开始ipa打包
xcodebuild -exportArchive \
-archivePath /Users/shun/Data/build/gre3K.xcarchive \
-configuration Debug \
-exportPath /Users/shun/Data/build/Debug \
-exportOptionsPlist /Users/shun/Data/build/ExportOptions.plist