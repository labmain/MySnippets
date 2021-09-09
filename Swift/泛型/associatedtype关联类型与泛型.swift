/**
定义一个协议时，有的时候声明一个或多个关联类型作为协议定义的一部分将会非常有用。
关联类型为协议中的某个类型提供了一个占位名（或者说别名），
其代表的实际类型在协议被采纳时才会被指定。
你可以通过 associatedtype 关键字来指定关联类型。比如使用协议声明更新cell的方法：
*/
/// 抽象模型
protocol Model {
    var name: String { get }
    var age: Int { get }
}
/// 模型实现协议
struct Student: Model {
    var name: String
    var age: Int
}
/// 协议，使用关联类型
protocol TableViewCell {
    associatedtype T: Model
    func updateCell(_ data: T)
}
/// 遵守TableViewCell
class MyTableViewCell: UITableViewCell, TableViewCell {
    func updateCell(_ student: Student) {
        print(student.name)
    }
}
