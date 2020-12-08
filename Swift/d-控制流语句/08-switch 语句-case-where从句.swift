/**< 
这里，where 后面直接跟一个布尔表达式，表示当该布尔表达式为真的时候则匹配当前的 case，这么一来，值绑定也无法覆盖到所有 case 情况了，所以需要添加 default 处理。
 */

let a = 8
 
switch a {
     
// 这里在做值绑定的同时限制了一个范围区间
case let v where v > 0 && v < 3:
    print("normal")
 
// 使用带有where从句的值绑定时，
// 可以出现多条值绑定的case，
// 并且也允许每条case声明的对象标识符完全相同
case let v where v >= 3 && v <= 10:
    print("v = \(v)")
     
default:
    print("Others")
}
