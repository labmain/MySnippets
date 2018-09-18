/*
@noescape 非逃逸闭包
当闭包作为参数传递进函数时，如果这个闭包只在函数中被使用，则开发者可以将这个闭包声明成非逃逸的，即告诉系统当此函数结束后，这个闭包的生命周期也将结束，这样做的好处是可以提高代码性能，将闭包声明成非逃逸的类型使用@noescape关键字。
(1) 默认，swift 3.0 弃用，函数结束后，这个闭包的生命周期也将结束。
(2) 在其内部如果需要使用self这个关键字，self可以被省略。

@escaping 逃逸闭包
逃逸的闭包常用于异步的操作，这类函数会在异步操作开始之后立刻返回，但是闭包直到异步操作结束后才会被调用。例如这个闭包是异步处理一个网络请求，只有当请求结束后，闭包的生命周期才结束。当闭包作为函数的参数传入时，很有可能这个闭包在函数返回之后才会被执行。

@autoclosure 自动闭包
(1)默认非逃逸
(2)闭包也可以被自动的生成，这种闭包被称为自动闭包，自动闭包自动将表达式封装成闭包。
(3)自动闭包不接收任何参数，被调用时会返回被包装在其中的表达式的值。
(4)当闭包作为函数参数时，可以将参数标记 @autoclosure 来接收自动闭包。
(5)自动闭包能够延迟求值,因为代码段不会被执行直到你调用这个闭包。
(6)自动闭包默认是非逃逸的，如果要使用逃逸的闭包，需要手动声明: @autoclosure @escaping 旧版本：@autoclosure(escaping)
*/

//(a)自动闭包演示
var students = ["A","B","C"]
let studentsProvider = { students.remove(at: 0) } //自动闭包自动将表达式封装成闭包
studentsProvider()

//(b)自动闭包演示
var list = [1,2,3,4,5,6]

//创建一个显式闭包
let closures = {
    list.append(7)
}
 
print(list)  //将打印[1,2,3,4,5,6]

closures()
print(list)  //引用传递，将打印[1,2,3,4,5,6,7]


func func1(closure: ()->Void) -> Void {
    //执行显式的闭包
    closures()
}

func func2(auto: @autoclosure ()->Void) -> Void {
    //执行自动闭包
    auto()
}

//显式闭包
func1(closure: closures)
print(list)   //将打印[1,2,3,4,5,6,7,7]

//将表达式自动生成闭包
func2(auto: list.append(8))
print(list)  //将打印[1,2,3,4,5,6,7,7,8]
