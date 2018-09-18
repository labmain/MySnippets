#### 创建一个Code Snippet

1. 书写Code Snippets。在声明@property属性的地方写下如下语句：
    `@property (nonatomic, copy) NSString *<#name#>; `
上面`<#name#>`的作用，在后面的使用效果中可以知道。
2. 新建Code Snippets。选中第一步中编写的语句，用鼠标左键拖到上图中指示的Code Snippets在Xcode中的区域里，就新建了一个Code Snippets。新建之后的效果如下所示：
![](http://7xpp6e.com1.z0.glb.clouddn.com/2016-09-27-17%3A00%3A53.jpg)

#### 属性说明
    1. Title：Code Snippets的标题；
    2. Summary：Code Snippets的描述文字；
    3. Platform：可以使用Code Snippets的平台，有IOS/OS X/All三个选项
    4. Language：可以在哪些语言中使用该Code Snippets
    5. Completion Shortcut：Code Snippets的快捷方式，比如本文第二部分编写switch代码段用到的sw，在这里，把属性设置的快捷方式设为pc
    6. Completion Scopes:可以在哪些文件中使用当前Code Snippets，比如全部位置，头文件中等，当然可以添加多个支持的位置。
    7. 最后的一个大得空白区域是对Code Snippets的效果预览。
#### Code Snippets路径
Xcode中的Code Snippets默认放在下面的目录中：
```
~/Library/Developer/Xcode/UserData/CodeSnippets  
```
