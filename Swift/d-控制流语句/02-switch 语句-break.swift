
var a = 10

switch a {
case 0:
    print("zero")
case 10:
    print("ten")
default:
    print("null")
}

/**< 
“一般情况下在 switch 语句块中需要包含一个 default 标签，以处理在当前 switch 语句块中没有被所有 case 覆盖到的情况。当然，如果 switch 后面的表达式的类型是 Void、Bool 或枚举等包含有限个数的值的类型，且这些值在 switch 语句块中被所有 case 覆盖到，那么 default 标签可省。
 */