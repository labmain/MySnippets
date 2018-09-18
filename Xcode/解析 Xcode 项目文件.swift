import xcodeproj
let xcode = try XcodeProj.init(pathString: "/Users/shun/Data/gre3000/gre3K.xcodeproj")// 项目路径
let targets = xcode.pbxproj.objects.nativeTargets
for item in targets.values {
    print(item.name) // 打印target名字
}


import PackageDescription

let package = Package(
    name: "xcodeprojTest",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
         .package(url: "https://github.com/tuist/xcodeproj.git", .upToNextMajor(from: "5.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "xcodeprojTest",
            dependencies: ["xcodeproj"]),
    ]
)
