

1. runModal
{
    // 注册通知
    NotificationCenter.default.addObserver(self, selector:#selector(self.windowClose(_:)),  name: NSWindow.willCloseNotification, object: nil)
}
  @IBAction func testAction(_ sender: Any) {
      let window = MyWindow(contentRect: NSRect(x: 0, y: 0, width: 400, height: 400), styleMask: [.closable, .titled, .resizable], backing: .buffered, defer: false)
        window.title = "test"
        window.backgroundColor = .red
        
        // NSWindowController 强引⽤ NSWindow，NSWindow ⾮强引⽤ 的持有NSWindowController 的指针
        let windowController = NSWindowController()
        window.windowController = windowController
        windowController.window = window
        // 启动
        NSApplication.shared.runModal(for: window)
    }
    // 关闭
     @objc func windowClose(_ aNotification: Notification){
       NSApplication.shared.stopModal()
   }

2. beginModalSession

var sessionCode: NSApplication.ModalSession?

{
    // 注册通知
    NotificationCenter.default.addObserver(self, selector:#selector(self.windowClose(_:)),  name: NSWindow.willCloseNotification, object: nil)
}
{
    // 启动
    sessionCode = NSApplication.shared.beginModalSession(for: window)
}
// 关闭
   @objc func windowClose(_ aNotification: Notification){
        if let ss = sessionCode {
            NSApplication.shared.endModalSession(ss)
            self.sessionCode = nil
        }
   }