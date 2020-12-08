/**< 
“Swift中如果不用 do 引出，而单单用花括号 { } ，那么它默认表达的是一个闭包表达式，而不是一个语句块。”
 */

let a = 1, b = 2
 
do {
    let a = 10
    let b = 20
    let c = 5

    do {
        let a = 30
        // 这里可以访问其外部语句块中声明的局部对象
        let b = 40 + c
        // 这里输出：inner a + b  = 75
        print("inner a + b = \(a + b)")
    }
    // 这里输出：a + b = 30
    print("a + b = \(a + b)")
}
 
// 这里输出：global a + b = 3
print("global a + b = \(a + b)")
