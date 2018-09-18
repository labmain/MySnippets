### breakpoint list (或者 br li) 命令

#### 管理断点

在`Xcode`里你可以点击单个断点来开启或关闭：
在 `LLDB` 中使用 `breakpoint enable <breakpointID> `和 `breakpoint disable <breakpointID>`：

```objc
(lldb) br li
Current breakpoints:
1: file = '/Users/arig/Desktop/DebuggerDance/DebuggerDance/main.m', line = 16, locations = 1, resolved = 1, hit count = 1

  1.1: where = DebuggerDance`main + 27 at main.m:16, address = 0x000000010a3f6cab, resolved, hit count = 1

(lldb) br dis 1
1 breakpoints disabled.
(lldb) br li
Current breakpoints:
1: file = '/Users/arig/Desktop/DebuggerDance/DebuggerDance/main.m', line = 16, locations = 1 Options: disabled

  1.1: where = DebuggerDance`main + 27 at main.m:16, address = 0x000000010a3f6cab, unresolved, hit count = 1

(lldb) br del 1
1 breakpoints deleted; 0 breakpoint locations disabled.
(lldb) br li
No breakpoints currently set.
```

#### `breakpoint set`创建断点

```objc
(lldb) breakpoint set -f main.m -l 16
Breakpoint 1: where = DebuggerDance`main + 27 at main.m:16, address = 0x000000010a3f6cab
```
也可以使用缩写形式 br。虽然 b 是一个完全不同的命令 (`_regexp-break` 的缩写)，但恰好也可以实现和上面同样的效果。

```objc
(lldb) b main.m:17
Breakpoint 2: where = DebuggerDance`main + 52 at main.m:17, address = 0x000000010a3f6cc4
```
##### 创建一个在函数开始处的断点：

C语言函数：

```objc
(lldb) b isEven
Breakpoint 3: where = DebuggerDance`isEven + 16 at main.m:4, address = 0x000000010a3f6d00
(lldb) br s -F isEven
Breakpoint 4: where = DebuggerDance`isEven + 16 at main.m:4, address = 0x000000010a3f6d00
```
OC函数：

```objc
(lldb) breakpoint set -F "-[NSArray objectAtIndex:]"
Breakpoint 5: where = CoreFoundation`-[NSArray objectAtIndex:], address = 0x000000010ac7a950
(lldb) b -[NSArray objectAtIndex:]
Breakpoint 6: where = CoreFoundation`-[NSArray objectAtIndex:], address = 0x000000010ac7a950
(lldb) breakpoint set -F "+[NSSet setWithObject:]"
Breakpoint 7: where = CoreFoundation`+[NSSet setWithObject:], address = 0x000000010abd3820
(lldb) b +[NSSet setWithObject:]
Breakpoint 8: where = CoreFoundation`+[NSSet setWithObject:], address = 0x000000010abd3820
```

#### 条件断点（Action）

例子：
打印 i，然后大声念出那个句子，接着打印了自定义的表达式，
下面是在 LLDB 而不是 Xcode 的 UI 中做这些的时候，看起来的样子：

```objc
(lldb) breakpoint set -F isEven
Breakpoint 1: where = DebuggerDance`isEven + 16 at main.m:4, address = 0x00000001083b5d00
(lldb) breakpoint modify -c 'i == 99' 1
(lldb) breakpoint command add 1
Enter your debugger command(s).  Type 'DONE' to end.
> p i
> DONE
(lldb) br li 1
1: name = 'isEven', locations = 1, resolved = 1, hit count = 0
    Breakpoint commands:
      p i

Condition: i == 99

  1.1: where = DebuggerDance`isEven + 16 at main.m:4, address = 0x00000001083b5d00, resolved, hit count = 0
```
