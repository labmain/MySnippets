# import path
export PATH=${PATH}:/usr/local/bin
# import what we have in bash_profile
source ~/.bash_profile

# oclint
workspaceExt=".xcworkspace"
tempPath="/Users/shun/Data/toeflListening备份/"
project_path=$(pwd)
project_name=$(ls | grep xcodeproj | awk -F.xcodeproj '{print $1}')

# 更新第三方库
if [ -f Podfile ]; then
echo "==========pod update========="
#pod update
fi

# find .xcworkspace
for workspacePath in `find ${project_path} -name "$project_name$workspaceExt" -print`
do
tempPath=${workspacePath}
break
done
echo "===========oclint=========="
if [ "$tempPath" == "" ];then
# oclint clean
xctool  -project ${project_name}.xcodeproj \
-scheme ${project_name} \
-reporter json-compilation-database:compile_commands.json \
clean
echo "===========oclint=project=clean=done========="
# build
xctool  -project ${project_name}.xcodeproj \
-scheme ${project_name} \
-reporter json-compilation-database:compile_commands.json \
build
echo "===========oclint=project=build=done========="
else
# oclint clean
xctool  -workspace ${project_name}.xcworkspace \
-scheme ${project_name} \
-reporter json-compilation-database:compile_commands.json \
clean
echo "===========oclint=workspace=clean=done========="
# build
xctool  -workspace ${project_name}.xcworkspace \
-scheme ${project_name} \
-reporter json-compilation-database:compile_commands.json \
build
echo "===========oclint=workspace=build=done========="
fi

# 生成报表
oclint-json-compilation-database -v \
-e Pods \
oclint_args -- -report-type html -o oclintReport.html \
-disable-rule ObjCAssignIvarOutsideAccessors \
-rc=MINIMUM_CASES_IN_SWITCH=3 \
-rc=LONG_VARIABLE_NAME=20 \
-disable-rule ShortVariableName \
-rc=CYCLOMATIC_COMPLEXITY=10 \
-rc=LONG_CLASS=700 \
-rc=LONG_LINE=200 \
-rc=LONG_METHOD=80 \
-rc=NCSS_METHOD=40 \
-rc=NESTED_BLOCK_DEPTH=5 \
-rc=TOO_MANY_FIELDS=20 \
-rc=TOO_MANY_METHODS=30 \
-rc=TOO_MANY_PARAMETERS=6

# 删除 compile_commands.json 可能会很大
jsonPath=$project_path/"compile_commands.json"
#echo ${jsonPath}
rm $jsonPath
open oclintReport.html
exit
