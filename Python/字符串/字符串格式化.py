# %s    字符串 (采用str()的显示)
# %r    字符串 (采用repr()的显示)
# %c    单个字符
# %b    二进制整数
# %d    十进制整数
# %i    十进制整数
# %o    八进制整数
# %x    十六进制整数
# %e    指数 (基底写为e)
# %E    指数 (基底写为E)
# %f    浮点数
# %F    浮点数，与上相同
# %g    指数(e)或浮点数 (根据显示长度)
# %G    指数(E)或浮点数 (根据显示长度)
# %%    字符"%"

# 示例1
print("I'm %s. I'm %d year old" % ('Vamei', 99))

# 示例2
print("I'm %(name)s. I'm %(age)d year old" % {'name':'Vamei', 'age':99})
