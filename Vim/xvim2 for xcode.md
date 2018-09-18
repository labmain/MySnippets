## 移动

```
b, B, f, F, gg, G, h, j, k, l, w, W, t, T, 0, $, ^, %, +, -, {, }, (, ), n, N, ', `, M, H, L
```
支持逗号和分号

## 标记（mark）

The '^' mark (last insertion point) and '.' mark (last change point) are also supported. gi (insert mode at last insertion point) is supported.

## 滚动

`C-d, C-f, C-e, C-u, C-b, C-y, zz, zb, zt`

## 跳转

`C-o, C-i, gd`

## 导航

`C-], C-t`

C-] is mapped to "Jump To Definition". C-t is mapped to "Go Back" (as it is the closest thing Xcode has to vims behavior).

## 插入

`a, A, i, I, o, O`

You can use Ctrl-o to enter to temporary normal mode during insert mode.

Ctrl-w,Ctrl-y,Ctrl-e commands in insert mode are supported. If you want to use Ctrl-e as "move to end of line" in insert mode (which is default Xcode behaviour), you can specify following line in .xvimrc.
> inoremap <C-e> <C-o>$

## 复制粘贴

`d, dd(d_), D, y, yy(y_), Y, c, cc(c_), C, r, s, S, x, X`

## 行连接（Line join）

`J`

## 缩进
Normal mode: `>, >>, <, <<`

##  大小写转化

Normal mode: , gu, gU, g
Visual mode: u, U, ~, gu, gU

## 撤销

`u, C-r`

## 代码折叠

`zc, zC, zm, zM, zo, zO, zr, zR`

`zc` - 折叠当前方法

`zM` - 折叠全部方法

`zo` - 撤销当前方法的折叠

`zR` - 撤销全部折叠


## 文本选择(Visual 模式)

`v, V, Ctrl-v`

(v, V in visual mode to toggle or escape from visual mode is supported)

Inserting with visual block is not supported currently (Ctrl-v + Shift-I does not work.)

## Visual 模式下 可选项

Text Object

ib, iB, i(, i), i{, i}, i[, i], i>, i<, i", i', iw, iW ab, aB, a(, a), a{, a}, a[, a], a>, a<, a", a', aw, aW

## 多窗口操作

 操作     | 描述
-----------|---------------------------
  C-w c    | 关闭当前的窗口
  C-w n    | 创建一个新的辅助窗口（使用上一次的布局）
  C-w o    | 删除所有的辅助窗口
  C-w q    | 删除当前的窗口
  C-w s    | 创建一个水平的辅助窗口
  C-w v    | 创建一个垂直的辅助窗口
C-w h,j,k,l| 在窗口之间移动焦点
  C-w w    | 跳转下一个窗口
  C-w W    | 跳转上一个窗口

  别名    | 描述
-----------|---------------------------
  C-w C-c  | Same as "C-w c"
  C-w C-n  | Same as "C-w n"
  C-w C-o  | Same as "C-w o"
  C-w C-q  | Same as "C-w q"
  C-w C-s  | Same as "C-w s"
  C-w C-v  | Same as "C-w v"
  C-w C-h  | Same as "C-w h"
  C-w C-j  | Same as "C-w j"
  C-w C-k  | Same as "C-w k"
  C-w C-l  | Same as "C-w l"
  C-w C-w  | Same as "C-w w"
  C-w C-W  | Same as "C-w W"

## 搜索和替换

`/, ?, #, *, g*, g#, :s, n, N`

也可以使用正则


## Insert mode commands

`C-y, C-e`

## 打印当路径
`C-g`

## Recording

q, @

更多见：https://github.com/XVimProject/XVim2/blob/master/Documents/Users/FeatureList.md