class Song: NSObject {
    @objc var name = ""
    var artistName = ""
    var albumArtwork: UIImage?
}

/// 需要继承 NSObject， keypath 路径需要 使用 @objc 修饰

let song = Song()
let name = song.value(forKey: #keyPath(Song.name))
song[keyPath: \.name] = "name"


// keyPath 定义在外面也是可以的：
let keyPath = \Song.name
// 等同
// let keyPath: ReferenceWritableKeyPath<Song, String> = \Song.name
// ==
let name = song[keyPath: keyPath]


/* 
KeyPath 和 #keyPath
Swift 中两个叫做 "Key Path" 的特性，一个是 #keyPath(Person.name) ，它返回的是 String 类型，
通常用在传统 KVO 的调用中， addObserver:forKeyPath: 中，如果该类型中不存在这个属性，则会在编译的时候提示你。
Swift Smart Key Path KeyPath<Root,Value> ，这是个泛型类型，用来表示从 Root 类型到 某个 Value 属性的访问路径


*/