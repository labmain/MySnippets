## 运行中更新UI属性

1. 打印视图层级：

    ```objc
    (lldb) po [[[UIApplication sharedApplication] keyWindow] recursiveDescription]
    <UIWindow: 0x7f82b1fa8140; frame = (0 0; 320 568); gestureRecognizers = <NSArray: 0x7f82b1fa92d0>; layer = <UIWindowLayer: 0x7f82b1fa8400>>
       | <UIView: 0x7f82b1d01fd0; frame = (0 0; 320 568); autoresize = W+H; layer = <CALayer: 0x7f82b1e2e0a0>>
    ```

2. 有了上面的输出，我们可以获取这个 view：

    ```objc
    (lldb) e id $myView = (id)0x7f82b1d01fd0
    ```

3. 然后在调试器中改变它的背景色：

    ```objc
    (lldb) e (void)[$myView setBackgroundColor:[UIColor blueColor]]
    ```

4. 更新到渲染服务中：

    ```objc
    (lldb) e (void)[CATransaction flush] // caflush
    ```

## Push 一个 View Controller

1. 获取rootVC：

    ```objc
    (lldb) e id $nvc = [[[UIApplication sharedApplication] keyWindow] rootViewController]
    ```

2. 然后 push 一个 child view controller：

    ```objc
    (lldb) e id $vc = [UIViewController new]
    (lldb) e (void)[[$vc view] setBackgroundColor:[UIColor yellowColor]]
    (lldb) e (void)[$vc setTitle:@"Yay!"]
    (lldb) e (void)[$nvc pushViewContoller:$vc animated:YES]
    ```
3. 最后最新下面命令：


```objc
(lldb) caflush // e (void)[CATransaction flush]
```

## 查看按钮的 target


```objc
(lldb) po [$myButton allTargets]
{(
    <MagicEventListener: 0x7fb58bd2e240>
)}
(lldb) po [$myButton actionsForTarget:(id)0x7fb58bd2e240 forControlEvent:0]
<__NSArrayM 0x7fb58bd2aa40>(
_handleTap:
)
```
