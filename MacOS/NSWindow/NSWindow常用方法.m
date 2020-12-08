窗口显示控制

1.窗口居屏幕中心显示

-(void)center;

2.前置显示窗口并且是其成为keyWindow

-(void)makeKeyAndOrderFront:(id)sender;

3.前置显示窗口

-(void)orderFront:(id)sender;

4.后置窗口,改变其在屏幕上的顺序

-(void)orderBack:(id)sender;

5.从屏幕上移除,隐藏窗口

-(void)orderOut:(id)sender;