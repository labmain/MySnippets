var number = 10
 
guard number < 100 else {
    // 这里使用exit()函数退出
    exit(0)
}
 
if_label: if number > 5 {
    let a = number * number
    guard a > 90 else {
        // 这里使用break语句跳出
        break if_label
    }
}
 
while number > 0 {
     
    let a = number
    number -= 1
     
    // 这里如果a为5的话，
    // 则直接跳过下面的打印语句，
    // 做下一次循环迭代
    guard a != 5 else {
        continue
    }
     
    print("number = \(a)")
}