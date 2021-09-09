[InjectionIII](https://github.com/johnno1962/InjectionIII) 热重载刷新UI

1.  `delegate didfinfish`添加：
```swift
#if DEBUG
Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")?.load()
#endif
```
2. 代码添加（injected方法里可以添加任意代码）：
```swift
extension UIViewController {
    #if DEBUG

  @objc func injected() {
  
    for subview in self.view.subviews {
        subview.removeFromSuperview()
    }
    if let sublayers = self.view.layer.sublayers {
        for sublayer in sublayers {
            sublayer.removeFromSuperlayer()
        }
    }
    viewDidLoad()
    viewWillAppear(true)
    viewDidAppear(true)
  }
    #endif

}

extension UIView {
    #if DEBUG
    @objc open func injected() {
        print("injected UIView")
        //find now VC
        guard let nowVC = UIApplication.shared.keyWindow?.rootViewController else {
            return
        }
        for subV in nowVC.view.subviews {
            subV.removeFromSuperview()
        }
        nowVC.viewDidLoad()
    }
    #endif
}

```
3. 保存代码即可刷新

有几个需要注意的地方：
1. 进行swizzling的类不要动态修改，否则二次交换，会引起死循环。
2. 不支持方法的删除：删除后，方法调用仍然有效，不抛异常。
3. 不支持新增类：新增类引入后使用无效。但类的重命名是有效的。
4. 属性新增、删除、修改：反射上体现不出来。


原理：
Injection 会监听源代码文件的变化，如果文件被改动了，Injection Server 就会执行 rebuildClass 重新进行编译、打包成动态库，也就是 .dylib 文件。编译、打包成动态库后使用 writeSting 方法通过 Socket 通知运行的 App
