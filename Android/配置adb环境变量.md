
# 配置

注意：`ANDROID_HOME`应该根据自己的sdk路径来填写，其余可以直接复制。
至于sdk路径，可以打开Android Studio，在preference(Windows的setting)中搜索sdk来查看。

```bash
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
```
