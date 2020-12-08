// Swift 的标识符
// 可以使用Emoji的一些符号用来作为有效的标识符
let 📱 = "iphone"
print(📱)

// 从swfit4.2开始就，可以使用self作为关键字了
var number: Int? = nil
if let self = number {
    print(self) // 这里的 self 是 number：Int
}

// `var` 是一个标识符
let `var` = 0

print("\(`var`)")