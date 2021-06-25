enum ResultCode {
    case bigger(String?)                    
    case smaller(String?)
    case equal(Int?)
}
var result = ResultCode.bigger("bigger")

switch result {
case .bigger(let str1):
    print(str1 ?? "大于")
case .smaller(let str2):
    print(str2 ?? "小于")
case .equal(let str3):
    print(str3 ?? "等于")
}

switch result {
case let .bigger(str):
    print(str ?? "大于")
case let .smaller(str):
    print(str ?? "小于")
case let .equal(str):
    print(str ?? "等于")
}

// 可选时，匹配有值
let test: Bar = Bar.a(1)
switch test {
case .a(let .some(i)):
    print(i)
default:
    break
}

// 您还可以?将其用作匹配的简写.some。因此，case .a(let .some(i)):成为case .a(let i?):。
let test: Bar = Bar.a(1)
switch test {
case .a(let i?):
    print(i)
default:
    break
}


// 判断
if case .a(let i) = test {
    // Action for .a case
}

if case let .a(i) = test {
    // Action for .a case
}