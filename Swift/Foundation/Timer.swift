
//MARK: - 使用
// iOS 10 之后下面的方法不会出现循环引用的问题，推荐使用。

// 自动执行的Timer
// 参数一：时间间隔，参数二：是否重复执行
Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in  
    // 定期执行的代码
    print("Hello World")
}

// 需要手动开启的Timer
let timer = Timer(timeInterval: 2.0, repeats: true) { (timer) in  
    // 定期执行的代码
    print("Hello World")
}

//MARK: - RunLoop

/* 
用来处理事件的循环，保持程序持续运行，App 启动后会开启一个主线程，主线程启动时会运行一个对应的 RunLoop，RunLoop 保证主线程不会被销毁，从而保证了程序的持续运行。
RunLoop 工作模式有 5 种，常见模式有以下 3 种：

default：默认模式。
tracking：界面跟踪模式。
common：通用模式，前面 2 种的结合。


将 Timer 添加到 RunLoop 后会自动开始工作。
*/

// 界面发生拖拽就会停止执行
RunLoop.current.add(timer, forMode: .default)
// 界面拖拽才会执行
RunLoop.current.add(timer, forMode: .tracking)
// 上面两种模式的结合，常用
RunLoop.current.add(timer, forMode: .common)

//MARK: -  暂停与重启
// 暂停
timer.fireDate = Date.distantFuture
// 重启
timer.fireDate = Date.distantPast

//MARK: - 销毁
// invalidate：阻止 Timer 再次触发并请求将其从 RunLoop 中删除，因此这种方式停止后无法让其重新开始工作。

timer.invalidate()