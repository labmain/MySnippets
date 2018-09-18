/* ===============  属性声明  ============ */
#strong
@property (nonatomic,strong) <#class#> *<#classname#>;

#weak
@property (nonatomic,weak) <#class#> *<#classname#>;

#copy
@property (nonatomic,copy) <#class#> *<#classname#>;

#assign
@property (nonatomic,assign) <#class#> <#classname#>;

#block:
@property (nonatomic,copy) <#Block#> <#block#>;

#代理声明
@property (nonatomic, weak) id<<#protocol#>> delegate;

#成员变量
@synthesize <#property#> = _<#propertyIvar#>;

/* ===============  打印  ================ */

#NSLog
NSLog(@"%@",<#object#>);

#打印字符串
NSLog(@"<##>");

#LogFunc
NSLog(@"%s",__FUNCTION__);
 
/* ===============  注释  ================ */

#mark
#pragma mark - <#注释内容#>

#warning:
#warning <#message#>

/* ===============  声明与实现   ================ */

#initObj
if(self=[super init]){
    <#init#>
}

return self;
#懒加载
- (<#Class#> *)<#obj#> {
    if(_<#obj#> == nil) {
        _<#obj#> = [[<#Class#> alloc] init];
    }
    return _<#obj#>;
}

#weakSelf
__weak typeof(self)weakSelf = self;

#方法声明
-(void)<#method#>;

#方法实现
- (void)<#methodName#>{
    <##>
}

#单例
+ (instancetype)shared<#name#> {
    static <#class#> *shared<#name#> = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared<#name#> = <#initializer#>;
    });
    
    return shared<#name#>;
}


/* ===============  GCD  ================ */

#AfterGCD(系统自带)
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(<#delayInSeconds#> * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    <#code to be executed after a specified delay#>
});

#子线程完成后，回到主线程
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
    <#ToDo#>
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        <#GoMain#>
    });
});

#OnceGCD(系统自带)
static dispatch_once_t onceToken;
dispatch_once(&onceToken, ^{
    <#code to be executed once#>
});

#MainGCD
dispatch_async(dispatch_get_main_queue(), ^{
    <#code#>
});

#GlobalGCD
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    <#TODO#>
});

/* ===============  其他  ================ */

#随机颜色
[UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0]

#for循环
for (int i = 0; i < <#count#>; i++) {
    <#statements#>
}

#取消https限制
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>