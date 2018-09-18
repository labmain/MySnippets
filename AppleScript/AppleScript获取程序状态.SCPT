
方法1
tell application "System Events" to set isRunning to exists (processes where name is "Mail")
if not isRunning then
tell application "Mail" to activate
repeat until isRunning
tell application "System Events" to set isRunning to exists (processes where name is "Mail")
end repeat
end if

方法2
on appIsRunning(appName)
tell application "System Events" to (name of processes) contains appName
end appIsRunning
if appIsRunning("Sparrow") then
tell application "Sparrow"
tell application "System Events"
key code 120 ---f2按键
end tell
end tell
else
