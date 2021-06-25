let aMovement = Movement.Left

// switch 分情况处理
switch aMovement{
case .Left: print("left")
default:()
}

// 明确的case情况
if case .Left = aMovement{
    print("left")
}

guard case .a = test else {
    return
}

if aMovement == .Left { print("left") }