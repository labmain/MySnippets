/// 存储属性
var borderColor: UIColor ? {
//赋值前执行
    willSet {
        print("1")
    }
//赋值后执行
    didSet {
        print("2")
    }
}

/// 计算属性
var sum : Int ? {
//获取值
    get {
        return self.sum
    }
//设置值
    set {
        self.sum = 10
    }
}
