## 直接替换
原文件
```
ARCHS = (
    arm64,
    x86_64,
);
```
结果文件
```
ARCHS = arm64;
```

> 执行命令,注意这里不能写成一行ARCHS = (是替换开始字符，);是替换结束字符
```shell
sed -i "" '/ARCHS = (/,/);/c\
ARCHS = arm64;\
' project.pbxproj
```

## 不更改源文件，保存到新文件
原文件
```html
<!--tokenHeadStart-->\
test\
<!--tokenHeadEnd-->
```
结果文件
```html
<!--tokenHeadStart-->\
<ul>\
<li><a href="#"></a><img alt="御寒单品大搜查" src="img/slide-01.jpg"></a></li>\
<li><a href="#"></a><img alt="袜！你好萌" src="img/slide-02.jpg"></a></li>\
<li><a href="#"></a><img alt="Moschino的戏谑人生" src="img/slide-03.jpg"></a></li>\
</ul>\
<!--tokenHeadEnd-->
```

执行命令tokenHeadStart是替换开始字符，tokenHeadEnd替换结束字符
```
sed '/tokenHeadStart/,/tokenHeadEnd/c\\
<!--tokenHeadStart-->\\
<ul>\\
<li><a href="#"></a><img alt="御寒单品大搜查" src="img/slide-01.jpg"></a></li>\\
<li><a href="#"></a><img alt="袜！你好萌" src="img/slide-02.jpg"></a></li>\\
<li><a href="#"></a><img alt="Moschino的戏谑人生" src="img/slide-03.jpg"></a></li>\\
</ul>\\
<!--tokenHeadEnd-->' file.txt >result.txt
```

# 单行替换

以xxx开头,`.*`结尾匹配行，替换内容
```shell
sed -i "" "s/def kuka_app_Name.*/def kuka_app_Name = 'KUKA Center_dev'/g" ./android/app/build.gradle
```
