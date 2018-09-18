去空格及特殊符号
s.strip() .lstrip() .rstrip(',')

复制字符串  
#strcpy(sStr1,sStr)
sStr= 'strcpy'
sStr = sStr
sStr= 'strcpy'
print sStr

连接字符串
#strcat(sStr1,sStr)
sStr= 'strcat'
sStr = 'append'
sStr+= sStr
print sStr

查找字符
#strchr(sStr1,sStr)
sStr= 'strchr'
sStr = 's'
nPos = sStr1.index(sStr)
print nPos

比较字符串
#strcmp(sStr1,sStr)
sStr= 'strchr'
sStr = 'strch'
print cmp(sStr1,sStr)

扫描字符串是否包含指定的字符
#strspn(sStr1,sStr)
sStr= '1345678'
sStr = '456'
#sStrand chars both in sStrand sStr
print len(sStrand sStr)

字符串长度
#strlen(sStr1)
sStr= 'strlen'
print len(sStr1)

将字符串中的大小写转换
#strlwr(sStr1)
sStr= 'JCstrlwr'
sStr= sStr1.upper()
#sStr= sStr1.lower()
print sStr

追加指定长度的字符串
#strncat(sStr1,sStr,n)
sStr= '1345'
sStr = 'abcdef'
n = 3
sStr+= sStr[0:n]
print sStr

字符串指定长度比较
#strncmp(sStr1,sStr,n)
sStr= '1345'
sStr = '13bc'
n = 3
print cmp(sStr1[0:n],sStr[0:n])

复制指定长度的字符
#strncpy(sStr1,sStr,n)
sStr= ''
sStr = '1345'
n = 3
sStr= sStr[0:n]
print sStr

将字符串前n个字符替换为指定的字符
#strnset(sStr1,ch,n)
sStr= '1345'
ch = 'r'
n = 3
sStr= n * ch + sStr1[3:]
print sStr

扫描字符串
#strpbrk(sStr1,sStr)
sStr= 'cekjgdklab'
sStr = 'gka'
nPos = -1
for c in sStr1:
     if c in sStr:
         nPos = sStr1.index(c)
         break
print nPos

翻转字符串
#strrev(sStr1)
sStr= 'abcdefg'
sStr= sStr1[::-1]
print sStr

查找字符串
#strstr(sStr1,sStr)
sStr= 'abcdefg'
sStr = 'cde'
print sStr1.find(sStr)

分割字符串
#strtok(sStr1,sStr)
sStr= 'ab,cde,fgh,ijk'
sStr = ','
sStr= sStr1[sStr1.find(sStr) + 1:]
print sStr
 或者
s = 'ab,cde,fgh,ijk'
print(s.split(','))

连接字符串
delimiter = ','
mylist = ['Brazil', 'Russia', 'India', 'China']
print delimiter.join(mylist)
PHP 中 addslashes 的实现
def addslashes(s):
     d = {'"':'\\"', "'":"\\'", "\0":"\\\0", "\\":"\\\\"}
    return ''.join(d.get(c, c) for c in s)
s = "John 'Johny' Doe (a.k.a. \"Super Joe\")\\\0"
print s
print addslashes(s)

只显示字母与数字
def OnlyCharNum(s,oth=''):
     s = s.lower();
    fomart = 'abcdefghijklmnopqrstuvwxyz013456789'
    for c in s:
        if not c in fomart:
             s = s.replace(c,'');
     return s;
print(OnlyStr("a000 aa-b"))
