第一步：打开 Mac 系统自带的 Automator 软件。
第二步：选择新建项目 -> 工作流程 -> 选择
第三步：选择 文件和文件夹 > 获得指定的 Finder 项目（向右拖动）> 添加需要处理的文件
【核心步骤】将下列代码粘贴替换 “运行 AppleScript 窗口” 中的全部代码。
最后一步：点击右上角 “运行” 按钮，程序开始自动处理。

```applescript
on run {input, parameters}	
    set theOutput to {}	
    tell application "Microsoft Word"
        repeat with thefile in input
            open thefile	
            set pdfPath to my makeNewPath(thefile)
            set theActiveDoc to the active document
            save as theActiveDoc file format format PDF file name pdfPath
            close theActiveDoc saving no
        end repeat	
    end tell	
    return theOutput
end run

on makeNewPath(f)	
    set d to f as string	
    if d ends with ".docx" then
        return (text 1 thru -5 of d) & "pdf"
    else if d ends with ".doc" then
        return (text 1 thru -4 of d) & "pdf"
    else		
        return d & ".pdf"	
    end if
end makeNewPath
```

