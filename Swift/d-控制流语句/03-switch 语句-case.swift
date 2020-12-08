/**< 
“在Swift编程语言中，switch 后面的表达式可以是表示任何类型的表达式，甚至还可以是一个元类型。但 case 后面的表达式必须是表示值类型的表达式，这就意味着通常来说，我们用 switch 语句的时候，往往判定的是一个表示结构体或枚举类型的表达式”
 */

class Test {
    var a = 0, b = 100
}
 
let t = Test()
let q = Test()

// 这里使用了我们后面会描述的值绑定，
// 这是合法的”
switch t {
case let obj:
    print("value = \(obj.a + t.b)")
}
 
switch type(of: t) {
case let type:
    print("type is: \(type)")
}

/**< 

“一条 case 或 default 标签下面可以含有多条语句，这就好比冒号后面跟着的是一个 do 语句块。而且Swift编程语言跟C语言不同的是，Swift允许在 case 与 default 后面的作用域内声明局部对象，而C语言则不行。在C语言中必须使用语句块做显式隔离。就从这一点我们可以看到，Swift中的 case 与 default 后面的作用域就已经好比是一个局部的语句块作用域了。此外，Swift跟C语言还有一点不同的是，默认情况下，一条 case 执行完成之后就自动退出整个 switch 语句块了，不需要显式添加 break 语句”
 */