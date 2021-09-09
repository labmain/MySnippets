# 基础语法
## help <command>

最简单命令是`help`，它会列举出所有的命令。
例如:

```objc
help print 或者 help thread。
```

##  print (缩写使用：prin，pri, p)

例如：

```objc
(lldb) print count
(NSUInteger) $0 = 99
(lldb) print $0 + 7
(unsigned long) $1 = 106
```

> 说明：(其实 print 是 `expression --` 的缩写)

### 打印变量
* 默认是10进制
* 十六进制

    ```objc
    (lldb) p/x 16
    0x10
    ```
* 二进制

    ```objc
    (lldb) p/t 16
    0b00000000000000000000000000010000
    (lldb) p/t (char)16
    0b00010000
    ```
你也可以使用 `p/c` 打印字符，或者 `p/s` 打印以空终止的字符串 (注：以 `'\0'` 结尾的字符串)。
[这里](https://sourceware.org/gdb/onlinedocs/gdb/Output-Formats.html)是格式的完整清单。

##  expression (缩写使用：e)

例如:

```objc
(lldb) expression count = 42
(NSUInteger) $4 = 42
(lldb) print count
(NSUInteger) $5 = 42
```
### 打印对象
参数 `e -O --`(查看对象description 方法的结果，)

```objc
(lldb) p @[ @"foo", @"bar" ]
(NSArray *) $8 = 0x00007fdb9b71b3e0 @"2 objects"
(lldb) e -O -- $8
<__NSArrayI 0x7fdb9b71b3e0>(
foo,
bar
)
```

参数 `e -O --`，缩写是：**`po`**

```objc
(lldb) po $8
<__NSArrayI 0x7fdb9b71b3e0>(
foo,
bar
)
(lldb) po @"lunar"
lunar
(lldb) p @"lunar"
(NSString *) $13 = 0x00007fdb9d0003b0 @"lunar"
```

# 进阶
## 定义变量和使用

```objc
(lldb) e int $a = 2
(lldb) p $a * 19
38
(lldb) e NSArray *$array = @[ @"Saturday", @"Sunday", @"Monday" ]
(lldb) p [$array count]
2
(lldb) po [[$array objectAtIndex:0] uppercaseString]
SATURDAY
(lldb) p [[$array objectAtIndex:$a] characterAtIndex:0]
error: no known method '-characterAtIndex:'; cast the message send to the method\s return type
error: 1 errors parsing expression
```

但是`LLDB`无法确定涉及的类型，需要指定类型：

```objc
(lldb) p (char)[[$array objectAtIndex:$a] characterAtIndex:0]
'M'
(lldb) p/d (char)[[$array objectAtIndex:$a] characterAtIndex:0]
77
```
## 流程控制

### Xcode上的流程控制按钮和LLDB命令：

![](http://img.labmain.com/2016-11-02-120307.jpg)

从左到右，四个按钮分别是：`continue`，`step over`，`step into`，`step out`。

* `process continue`命令对应 ：`continue`按钮
（别名`continue`，或直接缩写为`c`）
* `thread step-over`命令对应：`step over`按钮
（缩写：`next`或`n`）
* `thread step in`命令对应：`step into`
（缩写：`step`或`s`）

### Thread Return命令
它有一个可选参数，在执行时它会把可选参数加载进返回寄存器里，然后立刻执行返回命令，跳出当前栈帧。这意味这函数剩余的部分不会被执行。这会给 ARC 的引用计数造成一些问题，或者会使函数内的清理部分失效。但是在函数的开头执行这个命令，是个非常好的隔离这个函数，伪造返回值的方式 。

```objc
(lldb) p i
(int) $0 = 99
(lldb) s
(lldb) thread return NO
(lldb) n
(lldb) p even0
(BOOL) $2 = NO
(lldb) frame info
frame #0: 0x00000001009a5cc4 DebuggerDance`main + 52 at main.m:17
```
