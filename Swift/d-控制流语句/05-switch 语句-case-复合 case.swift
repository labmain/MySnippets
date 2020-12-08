// 复合 case

var a: Int8 = 10
 
switch a {
case 0, 1, 2:
    print("zero")
case a - 1, a, a + 1:
    print("Matched")
    a += 1
    print("a = \(a)")
     
default:
    break
}
// 上述代码中，像 case 0, 1, 2: 这条 case 标签语句就类似于：
if a == 0 || a == 1 || a == 2 {
     
}

