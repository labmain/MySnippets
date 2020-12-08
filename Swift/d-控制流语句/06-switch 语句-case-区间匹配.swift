var a: Int8 = 10
 
// 声明一个CountableRange<Int8>类型的对象
let range = Int8(1) ..< Int8(100)
 
switch a {
     
// 这里直接使用范围表达式进行匹配
case -5 ... 0:
    print("zero and below!")
     
// 我们甚至可以直接用CountableRange<Int8>对象作为匹配表达式
case range:
    print("one to ninety-nine!")
     
// 这里使用了复合case匹配，
// 由三个表达式构成。
// 前后两个都是范围表达式，
// 而中间一个表达式则为基本表达式（一个整数字面量）
case 100 ... 110, 112, 113 ... 120:
    print("others")
     
// 这里使用了单边范围，这也是没问题的。
// 这里要注意的是，(-100)必须用圆括号包围起来，
// 因为它前面的 ..< 也是一个前缀操作符，
// 两者之间必须用圆括号进行分隔，
// 并且(-100)表达式也必须紧贴 ..< 操作符
case 123... , ..<(-100):
    print("One sided range!")
     
// 对于整数类型，
// 即便上面的case通过范围表达式全都覆盖到了所有情况也必须添加default标签
default:
    print("out of range")
}
 
let str = "abc"
 
// 这里声明了一个Range<String>类型[…]