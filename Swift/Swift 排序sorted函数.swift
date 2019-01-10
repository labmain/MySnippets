1. 数组排序
e.g. 给一个顺序杂乱的数组升序或降序排列其中的元素

let array = [6, 4, 5, 3, 1, 0, 2]
    
> 降序

array.sorted { (s1, s2) -> Bool in
    return s1 > s2
}
    
> 升序

array.sorted { (s1, s2) -> Bool in
    return s1 < s2
}
/*
在 swift 中还可以通过简写的形式来书写升序降序
$0 来表示闭包的第一个参数，$1 来表示第二个，以此类推，in 也可以省略
*/

array.sorted{$0 > $1}
array.sorted{$0 < $1}

// 还可以直接省略参数
// 升序
array.sorted(by: <)
// 降序
array.sorted(by: >)

2. 字典排序
let dict = ["1": "a", "3": "c", "2": "b", "5": "e", "4": "d", "6": "f"]
    
> 根据 key 排序

/**< str.0 与 str.1 的意思是：元组 **(key: String, value: String) 第0个是 key，第一个是 value **
 从 **sorted **的函数定义可以看出来
 */

dict.sorted { (<#(key: String, value: String)#>, <#(key: String, value: String)#>) -> Bool in
    <#code#>
}
let result3 = dict.sorted { (str1, str2) -> Bool in
    return str1.0 < str2.0
    }
    > 根据 value 排序

let result4 = dict.sorted { (str1, str2) -> Bool in
    return str1.1 < str2.1
    }
    > 简化：与数组的简化类似

// 根据 key
dict.sorted{$0.0 < $1.0}
// 根据 value
dict.sorted{$0.1 < $1.1}

// 进一步省略参数
dict.sorted(by: <)
dict.sorted(by: >)
