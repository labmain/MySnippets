如果想让标系原点从左上⻆开始，可以通过覆盖视图的 isFlipped ⽅法，返回 true。

final class CustomView: NSView {
    override var isFlipped: Bool {
        get {
            return true
        }
    }
}