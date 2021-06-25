let array = [1,2,3,4]
// prefix 获取两个
print(array.prefix(2))//输出[1,2]

// suffix 获取后两个
print(array.suffix(2))//输出[3,4]

print(array.prefix(upTo: 3))//输出[1,2,3]
print(array.suffix(from: 1))//输出[2,3,4]


// 获取的新的数组，要转成Array
Array(array.prefix(3))