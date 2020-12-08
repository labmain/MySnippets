同步更新源码
```bash
git pull
```
更新FEEDS
```bash
./scripts/feeds update -a && ./scripts/feeds install -a
```
清除编译配置和缓存
```bash
rm -rf ./tmp && rm -rf .config
```
```bash
make menuconfig

预编译下载（建议先下载）
```
make download V=s
```

```
多线程编译
```bash
make V=s -j$(nproc)
```
V=s：啰嗦模式，会详细显示整个编译过程，排错比较好用。
-j1：线程限制，建议第一次编译用单线程，如果出错容易排错。
-j$(nproc)会自自动用你CPU核心数来进行编译。


PS:若是第二次编译出现

package/Makefile:65: recipe for target ‘package/install’ failed
make[2]: *** [package/install] Error 255

请输入 make clean 然后重新编译