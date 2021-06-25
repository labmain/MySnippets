// map方法将原来数组中元素映射到一个新的数组中：

func map<T>(_ transform: (T) throws -> T) rethrows -> [T]

// map方法参数是一个闭包，闭包中可以执行相应的逻辑，执行完毕后返回一个<T>泛型数组 
let array = [1,2,3,4]
let mappedArray = array.map{$0 * 10}
for i in mappedArray {
    print(i)//会输出10、20、30、40
}
