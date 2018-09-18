主要涉及到三个函数
1、os.path.exists(path) 判断一个目录是否存在
2、os.makedirs(path) 多层创建目录
3、os.mkdir(path) 创建目录

def mkdir(path):
    # 引入模块
    import os
 
    # 去除首位空格
    path=path.strip()
    # 去除尾部 \ 符号
    path=path.rstrip("\\")
 
    # 判断路径是否存在
    # 存在     True
    # 不存在   False
    isExists=os.path.exists(path)
 
    # 判断结果
    if not isExists:
        # 如果不存在则创建目录
        print path+' 创建成功'
        # 创建目录操作函数
        os.makedirs(path)
        return True
    else:
        # 如果目录存在则不创建，并提示目录已存在
        print path+' 目录已存在'
        return False
 
# 定义要创建的目录
mkpath="d:\\qttc\\web\\"
# 调用函数
mkdir(mkpath)

说明
在以上DEMO的函数里，我并没有使用os.mkdir(path)函数，而是使用了多层创建目录函数os.makedirs(path)。这两个函数之间最大的区别是当父目录不存在的时候os.mkdir(path)不会创建，os.makedirs(path)则会创建父目录。
比如：例子中我要创建的目录web位于D盘的qttc目录下，然而我D盘下没有qttc父目录，如果使用os.mkdir(path)函数就会提示我目标路径不存在，但使用os.makedirs(path)会自动帮我创建父目录qttc，请在qttc目录下创建子目录web。
