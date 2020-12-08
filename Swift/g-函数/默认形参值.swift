/// 定义了带有两个形参的函数foo，
/// 其中第二个形参带有默认值2.0
func foo(param1: Int, param2: Float = 2.0) {
    print("Value = \(Float(param1) + param2)")
}
// 这里对foo函数的调用缺省了对param2形参的实参传递
foo(param1: 10)
 
// 这里对foo函数的调用也传递了param2所对应的实参
foo(param1: 20, param2: 5.0)
 
/// 这里定义了一个带有Int类型的形参param，
/// 它具有默认值10
func boo(param: Int = 10) {
    print("param = \(param)")
}
 
// 调用boo函数时使用默认的形参值
boo()
 
// 调用boo函数时显式传递实参3
boo(param: 3)