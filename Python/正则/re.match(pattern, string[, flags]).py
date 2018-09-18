__author__ = 'CQC'
# -*- coding: utf-8 -*-

#导入re模块
import re

# 将正则表达式编译成Pattern对象，注意hello前面的r的意思是“原生字符串”
pattern = re.compile(r'hello')

# 使用re.match匹配文本，获得匹配结果，无法匹配时将返回None
result1 = re.match(pattern,'hello')
result2 = re.match(pattern,'helloo CQC!')
result3 = re.match(pattern,'helo CQC!')
result4 = re.match(pattern,'hello CQC!')

#如果1匹配成功
if result1:
    # 使用Match获得分组信息
    print result1.group()
else:
    print '1匹配失败！'


#如果2匹配成功
if result2:
    # 使用Match获得分组信息
    print result2.group()
else:
    print '2匹配失败！'


#如果3匹配成功
if result3:
    # 使用Match获得分组信息
    print result3.group()
else:
    print '3匹配失败！'

#如果4匹配成功
if result4:
    # 使用Match获得分组信息
    print result4.group()
else:
    print '4匹配失败！'
    
# 匹配分析

# 1.第一个匹配，pattern正则表达式为’hello’，我们匹配的目标字符串string也为hello，从头至尾完全匹配，匹配成功。

# 2.第二个匹配，string为helloo CQC，从string头开始匹配pattern完全可以匹配，pattern匹配结束，同时匹配终止，后面的o CQC不再匹配，返回匹配成功的信息。

# 3.第三个匹配，string为helo CQC，从string头开始匹配pattern，发现到 ‘o’ 时无法完成匹配，匹配终止，返回None

# 4.第四个匹配，同第二个匹配原理，即使遇到了空格符也不会受影响。    