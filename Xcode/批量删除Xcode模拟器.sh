# 获取模拟器列表
OUTPUT="$(xcrun simctl list)"
# 解析出UUID，然后保存到文件中
echo $OUTPUT | awk -F "[()]" '{ for (i=2; i<NF; i+=2) print $i }' | grep '^[-A-Z0-9]*$' > output.txt
# 通过UUID循环删除模拟器
for UUID in `awk '{ print $1 }' output.txt`
do
xcrun simctl delete $UUID
done
