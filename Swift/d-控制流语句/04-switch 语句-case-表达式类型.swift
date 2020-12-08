/**< 
“Swift编程语言的 switch 后面的表达式类型不仅限于基本类型，只要是遵循 Equatable 协议的类型的对象都能作为有效的 switch 表达式，
 */

struct MyObject: Equatable {
    var a = 0
    var b = 1
     
    public static func == (lhs: MyObject, rhs: MyObject) -> Bool {
        return lhs.a == rhs.a && lhs.b == rhs.b
    }
}
 
var obj = MyObject(a: 3, b: 4)
var obj2 = MyObject(a: 3, b: 3)
 
switch obj {
case MyObject():
    print("dummy object")
     
case obj2:
    print("obj2")
     
case MyObject(a: 3, b: 4):
    print("Correct object")
     
default:
    print("No match!")
}
