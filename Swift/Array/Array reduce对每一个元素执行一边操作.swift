// reduces方法可以把数组编程一个元素。首先需要指定一个初始值，然后在闭包中写一个reduce规则，
// 接着reduce方法就会开始递归地对数组中的元素进行闭包中的运算，直到运算出最后一个结果，实例如下：
// 接收两个参数，一个为类型Result的初始值，
// 另一个为把类型为Result的元素和类型为Element的元素组合成一个类型为Result的值的函数。
// 最终结果整个数组就变成了一个类型为Result的值。

let array = [1,2,3,4]
let result = array.reduce(0, {$0 + $1})
//简化写法
let result = array.reduce(0, +)
print(result)//输出10
