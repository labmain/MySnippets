/// 版本判断，清空启动图缓存（限制条件）
NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
if (![[kUserDefaults stringForKey:@"kLaunchScreenCacheVersion"] isEqualToString:version]) {
    [kUserDefaults setValue:version forKey:@"kLaunchScreenCacheVersion"];
    [self removeLaunchScreenCacheIfNeeded];
}

// 清空启动图缓存
- (void)removeLaunchScreenCacheIfNeeded {
    NSString *filePath = [NSString stringWithFormat:@"%@/Library/SplashBoard", NSHomeDirectory()];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSError *error = nil;
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
        if (error) {
            NSLog(@"清除LaunchScreen缓存失败");
        } else {
            NSLog(@"清除LaunchScreen缓存成功");
        }
    }
}



// 原因是苹果会对启动图进行缓存，清空缓存就会加载最新的启动图