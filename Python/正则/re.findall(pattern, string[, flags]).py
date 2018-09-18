import re

pattern = re.compile(r'\d+')
print re.findall(pattern,'one1two2three3four4')

### 输出 ###
# ['1', '2', '3', '4']