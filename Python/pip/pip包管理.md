### 安装(install)模块
#### 在线安装
```
pip install  #一个具体的Python模块
pip install -r requirements.txt #逐行安装模块
pip install  --index-url
```
[http://pypi.douban.com/simple](http://pypi.douban.com/simple)
```
通过使用==、>=、、 pip install /
或
pip install --use-wheel --no-index --find-links=wheelhouse/
前有空格
可简写为
pip install --no-index -f=/
```
### 列出已安装的包
```
pip freeze
或者
pip list

pip freeze | wc -l #统计安装的模块
```
### 卸载模块
```
pip uninstall  # 只卸载模块本身，其依赖模块不会卸载
或
pip uninstall -r requirements.txt
```
### 升级包
```
pip install -U
或
pip install  --upgrade
```
### 显示包所在的目录
```
pip show -f
```
### 搜索包
```
pip search
```
### 查询可升级的包
```
pip list -o
```
### 查看已经安装的包
```
pip show --files SomePackage
```
### 下载包而不安装
```
pip install  -d
或
pip install -d  -r requirements.txt
```
### 导出模块到指定的文件requirements.txt
```
pip freeze > /requirements.txt
``
