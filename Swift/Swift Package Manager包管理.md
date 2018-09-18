## 创建 Package

```bash
mkdir helloword    // 创建 helloword 文件夹
cd helloword       // 进入 helloword 文件夹
swift package init --type executable  // 在当前文件下初始化 package 为可执行项目
swift run          // 编译并执行
Hello, world!
```

当前文件夹下执行 `swift package generate-xcodeproj` 命令生成一个 Xcode 工程


## 添加 Package 依赖

```swift
import PackageDescription

let package = Package(
    name: "MyPackage",
    dependencies: [
        // 添加依赖包：PlayingCard
        .Package(url: "https://github.com/apple/example-package-playingcard.git", from: "3.0.0"),
    ]
)
```
更新包
`swift package update`

下载内容
swift package fetch
