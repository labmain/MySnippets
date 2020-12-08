## 关键字 @objcMembers

OC 调用 Swift属性，Swift的类前面要加 `@objcMembers`

比如：

```swift
@objcMembers class test {
    var test: NSString!
}
```

## 关键字 @objc

swift 重写 OC 方法，需要在方法前面添加 `@objc`
例如：

```swift
@objc private func tipBtnClick()  {
    view.showView()
}
```