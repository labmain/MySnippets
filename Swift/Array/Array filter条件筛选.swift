// filter方法:可以过滤数组中不满足筛选条件的元素，返回满足筛选条件的元素所组成的数组。

func filter(_ isIncluded: (UInt8) throws -> Bool) rethrows -> [UInt8]
// filter方法参数是一个闭包，闭包返回值是Bool类型，
// 当满足筛选条件的时闭包才有返回值，filter返回值是一个<T>的泛型数组

// 用法如下：

let array = [1,2,3,4]
let filteredArray = array.filter{$0 > 2}
for i in filteredArray {//实际相当于for i in [3,4], 最后输出 3 和 4
    print(i)
}