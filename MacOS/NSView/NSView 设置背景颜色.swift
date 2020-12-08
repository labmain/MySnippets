// 想要设置NSView背景颜色的时候，因NSView不带有backgroundColor属性，想要让其具有一个layer，通过layer的backgroundColor属性来设置颜色
// 注意必须要有view.wantsLayer = true，使得NSView成为一个layer-backed view，才能操作它的layer属性使设置的颜色生效。
view.wantsLayer = true
view.layer?.backgroundColor = NSColor.red.cgColor