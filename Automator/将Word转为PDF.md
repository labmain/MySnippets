```shell
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