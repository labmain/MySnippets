# 1. 创建一个 dmg 磁盘镜像(8500根据实际文件大小设置)
hdiutil create -o /tmp/Catalina -size 8500m -volname Catalina -layout SPUD -fs HFS+J

# 2. 将 dmg 挂在到 macOS 上
hdiutil attach /tmp/Catalina.dmg -noverify -mountpoint /Volumes/Catalina

# 3. 创建 macOS Catalina 安装包
sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/Catalina --nointeraction

# 4. 卸载 Catalina 安装盘
hdiutil detach /volumes/Install\ macOS\ Catalina

# 5. 将 dmg 镜像文件转换为 .cdr 镜像文件（VMware 支持 .cdr 文件安装，因此可以直接将该 .cdr 文件拷贝到 Windows 系统下进行 macOS 10.15.1 Catalina 虚拟机的安装）
hdiutil convert /tmp/Catalina.dmg -format UDTO -o ~/Desktop/Catalina.cdr

# 6. 将 .cdr 格式的镜像文件转换为 .iso 格式的镜像文件
mv ~/Desktop/Catalina.cdr ~/Desktop/Catalina.iso