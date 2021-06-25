// flatMap可用于可选型与数组，可选型中的faltMap会把嵌套的可选型封装成一个可选型，
// 而数组中的flatMap会检测数组中有没有嵌套的数组，把嵌套的数组解构再重组成一个数组。

// 组合两个数组
let sizes = ["S","M","L"]
let colors = ["red","black","white"]
let groups = sizes.flatMap { size in
    colors.map({ color in
        return (size  + " " + color)
    })
}
