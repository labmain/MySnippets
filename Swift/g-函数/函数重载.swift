class numModel {
    var aNum: Int = 0
    var bNum: Int = 0
    var cNum: Int = 0
    init(a: Int, b: Int, c: Int) {
        aNum = a
        bNum = b
        cNum = c
    }
    static func +(left: numModel, right: numModel) -> numModel {
        return numModel(a: left.aNum+right.aNum, b: left.bNum+right.bNum, c: left.cNum+right.cNum)
    }
}

// Swift 支持重载运算符，比如 Swift 支持 "my"+"name"+"is" -> "my name is" 这样的字符串加法操作，这让 Swift 比 OC 便利了很多，我们自己定义的类也支持运算符的重载，比如下面的类的 “+” 方法，则会合并两个 model 中的每个属性然后返回一个新的 model：