// 我们这里要注意的是，如果我们要表示一个元组，那么圆括号中必须至少要有2个元素，否则圆括号将被视作为圆括号操作符，而不是一个元组字面量
// 声明一个元组常量tuple，
// 其类型为：(int: Int, Double, bool: Bool, String)，
// 注意，它第二个与最后一个元素类型是没有标签的。
let tuple = (int: 10, 0.5, bool: false, "hello")
 
// 访问tuple的第一个元素
let a = tuple.int
 
// 访问tuple的第二个元素
let b = tuple.1
 
// 访问tuple的第三个元素
let c = tuple.bool
 
// 访问tuple的第四个元素
let s = tuple.3

// 我们看到元组的声明以及对其元素的访问之后一定会有这么一种印象——它就如同一个轻便型的匿名结构体
// 因此元组往往用于一个函数返回多个不同类型的对象的场合
 