1. 新建 automator 工作流程
2. 将待转换文件拖入到操作框中 
3. 添加==运行AppleScript==到操作框 
4. 将下列代码复制到 AppleScript 中

```shell
on run {input, parameters}
    set theOutput to {}
    tell application "Microsoft PowerPoint" -- work on version 15.15 or newer
        launch
        set theDial to start up dialog
        set start up dialog to false
        repeat with i in input
            open i
            set pdfPath to my makeNewPath(i)
            save active presentation in pdfPath as save as PDF -- save in same folder
            close active presentation saving no
            set end of theOutput to pdfPath as alias
        end repeat
        set start up dialog to theDial
    end tell
    return theOutput
end run

on makeNewPath(f)
    set t to f as string
    if t ends with ".pptx" then
        return (text 1 thru -5 of t) & "pdf"
    else
        return t & ".pdf"
    end if
end makeNewPath
```

5. 点击运行，齐活~