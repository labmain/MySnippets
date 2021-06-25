// sorted方法接受另一个函数作为参数，这个参数是一个决定两个元素谁放在前面的函数型参数，默认是使用小于号的比较。
//通常会把排序函数写成一个闭包，闭包会被不停的调用，在内部采用了快速排序或者其它任意的排序方法。
let array = [3,1,2,4]
let sortedArr = array.sorted{$0 < $1}
//简写，默认从小到大
let sortedArr = array.sorted()
print(sortedArr)//输出 [1, 2, 3, 4]