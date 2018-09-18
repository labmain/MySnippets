if - else if - else语句块

AppleScript中的条件语句形式如下：

if 条件 then
	...
else if 条件 then
	...
else
	...
end if


最简单的形式是：

if 条件 then ...

注意上面的语句必须在同一行内完成。不需要也不能有end if出现。
使用例如：

if true then set x to 1

-- error
-- if false then set y to 0 end if
