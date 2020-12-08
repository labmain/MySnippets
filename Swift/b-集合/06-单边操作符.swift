/**< 
“Swift 4.0引入了单边范围操作符，表示只对范围操作符的一端设置操作数，另一端缺省。它有三种类型—— a... 、...b、..<b”
 */

/// 声明一个常量数组
let array = [1, 2, 3, 4, 5]
 
/// 取array从索引2到最后一个元素的子数组，
/// sub1的类型为ArraySlice<Int>
let sub1 = array[2...]
 
// 打印出：sub1 = [3, 4, 5]
print("sub1 = \(sub1)")
 
/// 取array从第一个元素到索引3元素的子数组
/// sub2的类型为ArraySlice<Int>
let sub2 = array[...3]
 
// 打印出：sub2 = [1, 2, 3, 4]
print("sub2 = \(sub2)")
 
/// 取array从第一个元素到索引2元素的子数组
/// sub3的类型为ArraySlice<Int>
let sub3 = array[..<3]
 
// 这里打印：sub3 = [1, 2, 3]
print("sub3 = \(sub3)")

if (...3).contains(3) {
    // 由于3在 ...3 的范围内，
    // 所以这里打印出contains
    print("contains")
}
 
// 由于4不在 5... 的范围内，
// 所以这里不打印contains
if (5...).contains(4) {
    print("contains")
}
 
// 由于5不在 ..<5 的范围内，
// 所以这里不打印contains
if (..<5).contains(5) {
    print("contains")
}