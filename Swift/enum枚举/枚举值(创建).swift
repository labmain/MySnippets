// 映射到整型
enum Movement: Int {
    case Left = 0
    case Right = 1
    case Top = 2
    case Bottom = 3
}

// 同样你可以与字符串一一对应
enum House: String {
    case Baratheon = "Ours is the Fury"
    case Greyjoy = "We Do Not Sow"
    case Martell = "Unbowed, Unbent, Unbroken"
    case Stark = "Winter is Coming"
    case Tully = "Family, Duty, Honor"
    case Tyrell = "Growing Strong"
}

// 或者float double都可以(同时注意枚举中的花式unicode)
enum Constants: Double {
    case π = 3.14159
    case e = 2.71828
    case φ = 1.61803398874
    case λ = 1.30357
}

// 隐式指定的原始值
// Mercury = 1, Venus = 2, ... Neptune = 8
enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}


// North = "North", ... West = "West"
enum CompassPoint: String {
    case North, South, East, West
}