// 方法一：
dataArray.forEach { (item) in
    debugPrint(item)
}
// 方法二：
for item in dataArray {
    debugPrint(item)
}
// 方法三：
// 该循环方式可设置开闭区间，设置时需注意数组越界
for i in 0..<dataArray.count {
   debugPrint(dataArray[i])
}
// 方法四：
//该方法可以循环输出元组类型，包含下标index及对应的item
for (index,item) in dataArray.enumerated() {
    debugPrint(index,item)
}

// 注释：我尝试使用方法一与方法二，分别遍历输出0~100000之间的数字，来比较耗时长短。方法一耗时0.1173100471496582，方法二耗时0.0031960010528564453，
// 因此方法二耗时较短，故遍历数据较多时建议使用方法二。