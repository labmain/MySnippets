// 定义泛型函数
func 函数名<泛型1,泛型2,…>(形参列表)->返回值类型
{
// 函数体...
}


/// 使用泛型函数交换两个参数的值
func changeValueToValue<T>(value1: inout T,value2: inout T) {
    let value3 = value1
    value1 = value2
    value2 = value3
}
var  str1 = "2222";
var  str2 = "3333";
print(str1+str2) // 22223333
changeValueToValue(value1: &str1, value2: &str2)
print(str1+str2) // 33332222
