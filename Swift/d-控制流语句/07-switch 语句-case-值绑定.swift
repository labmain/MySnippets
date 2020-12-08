/**< 

“在一般情况下，我们可以直接在 case 后面直接跟 let 或 var 声明一个局部对象，以捕获 switch 后面表达式的值。该对象只能在当前的 case 体中可见。如果我们在一般情况下使用了值绑定，那么我们就无需再写 default 处理了，因为值绑定的情况是直接获取 switch 表达式的值，这也就意味着已经覆盖了所有选择情况”

 */

let a = 8
 
switch a {
case 0, 1, 2 ... 5:
    print("normal")
 
// 这里在case后面直接声明了局部对象v，
// 用做值绑定
case let v:
    print("v = \(v)")
     
// 这里不再需要default标签
}
 
switch a {
     
// 这里在case后面直接声明了一个变量v，
// 我们还能在这条case语句下修改变量v的值
case var v:
    v += 1
    print("v = \(v)")
     
// 这里会发出警告，
// 因为这里一旦用了值绑定，
// 那么该case必定会先执行，
// 所以后面的case体都会被忽略，
// 除非在执行的case体中使用了直通语句
// case 100:
//     print("No reached!")
}
