// 独立窗口展示
NSAlert *alert = [[NSAlert alloc] init];
alert.messageText = @"提示";
[alert setShowsHelp:NO];
alert.informativeText = @"请输入您的口令";
alert.alertStyle = NSAlertStyleWarning;
[alert addButtonWithTitle:@"确定"];
[alert runModal]; // runModal返回值可以判断点击事件

// sheet 方式弹出警告
NSString *message = @"这里是提示的信息";
NSAlert *alert = [NSAlert new];
[alert addButtonWithTitle:@"确定"];
[alert addButtonWithTitle:@"取消"];
[alert setMessageText:message];
[alert setAlertStyle:NSCriticalAlertStyle];
[alert beginSheetModalForWindow:[self.view window] completionHandler:^(NSModalResponse returnCode) {
    if(returnCode == NSAlertFirstButtonReturn){
       //确定
    }else if(returnCode == NSAlertSecondButtonReturn){
       //取消 
    }
}];