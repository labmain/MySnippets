常用的创建代码：
NSRect frame = CGRectMake(0, 0, 200, 200);
NSUInteger style =  NSTitledWindowMask | NSClosableWindowMask |NSMiniaturizableWindowMask | NSResizableWindowMask;
NSWindow *window = [NSWindow alloc]initWithContentRect:frame styleMask:style backing:NSBackingStoreBuffered defer:YES];
window.title = @"New Create Window";
[window makeKeyAndOrderFront:self];

1、styleMask: 按位表示的窗口风格参数

enum {
   NSBorderlessWindowMask = 0, //没有顶部titilebar边框
   NSTitledWindowMask = 1 << 0, //有顶部titilebar边框
   NSClosableWindowMask = 1 << 1,//带有关闭按钮
   NSMiniaturizableWindowMask = 1 << 2,//带有最小化按钮
   NSResizableWindowMask = 1 << 3,//恢复按钮
   NSTexturedBackgroundWindowMask = 1 << 8 //带纹理背景的window
};


2、backing:窗口绘制的缓存模式
enum {
   NSBackingStoreRetained       = 0,// 兼容老系统参数,基本很少用到
   NSBackingStoreNonretained  = 1,//不缓存直接绘制
   NSBackingStoreBuffered        = 2//缓存绘制
};

3、defer:表示延迟创建还是立即创建

4、NSWindowStyleMask
typedef NS_OPTIONS(NSUInteger, NSWindowStyleMask) {
    NSWindowStyleMaskBorderless = 0,
    NSWindowStyleMaskTitled = 1 << 0,//显示标题
    NSWindowStyleMaskClosable = 1 << 1,//可关闭，如果不加，则关闭按钮处显示一个灰色按钮，不可点击
    NSWindowStyleMaskMiniaturizable = 1 << 2, //可最小化
    NSWindowStyleMaskResizable	= 1 << 3,//可调整尺寸，即拉伸
    
    NSWindowStyleMaskTexturedBackground = 1 << 8,//北京味文字，标题栏没有边框线。如果需要线，要使用 NSUnifiedTitleAndToolbarWindowMask
    
    NSWindowStyleMaskUnifiedTitleAndToolbar = 1 << 12, //标题栏和toolBar 下有统一的分割线
    
    NSWindowStyleMaskFullScreen NS_ENUM_AVAILABLE_MAC(10_7) = 1 << 14,//全屏显示
   
    NSWindowStyleMaskFullSizeContentView NS_ENUM_AVAILABLE_MAC(10_10) = 1 << 15,//contentView会充满整个窗口。
    
    /* 下面样式只适用于NSPanel及其子类 */
    NSWindowStyleMaskUtilityWindow			= 1 << 4,
    NSWindowStyleMaskDocModalWindow 		= 1 << 6,
    NSWindowStyleMaskNonactivatingPanel		= 1 << 7, 
    NSWindowStyleMaskHUDWindow NS_ENUM_AVAILABLE_MAC(10_6) = 1 << 13 //用于头部显示的panel 
};