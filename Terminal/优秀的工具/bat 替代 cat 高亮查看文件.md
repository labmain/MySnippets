## 安装
GitHub地址：https://github.com/sharkdp/bat

```
brew install bat
```

## 使用

显示单个文件  
`bat README.md`

一次显示多个文件  
`bat src/*.rs`

显示不显示的字符-A  
`bat -A /etc/hosts`

显示行号-n  
`bat -n main.rs`

## 配置

获取配置路径  
`bat --config-file`


示例配置：  
```bash
# Set the theme to "TwoDark"
--theme="TwoDark"

# Show line numbers, Git modifications and file header (but no grid)
--style="numbers,changes,header"

# Use italic text on the terminal (not supported on all terminals)
--italic-text=always

# Use C++ syntax for .ino files
--map-syntax "*.ino:C++"

```