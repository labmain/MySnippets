属性观察者，类似于触发器。用来监视属性的除初始化之外的属性值变化，当属性值发生改变时可以对此作出响应。有如下特点：
1，不仅可以在属性值改变后触发didSet，也可以在属性值改变前触发willSet。
2，给属性添加观察者必须要声明清楚属性类型，否则编译器报错。
3，willSet可以带一个newName的参数，没有的话，该参数默认命名为newValue。
4，didSet可以带一个oldName的参数，表示旧的属性，不带的话默认命名为oldValue。
5，属性初始化时，willSet和didSet不会调用。只有在初始化上下文之外，当设置属性值时才会调用。
6，即使是设置的值和原来值相同，willSet和didSet也会被调用

/// 存储属性
var borderColor: UIColor {
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
