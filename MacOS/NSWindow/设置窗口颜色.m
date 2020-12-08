方法1：window.backgroundColor

- (void)setWindowBKColor {
    [self.window setOpaque:NO];
    [self.window setBackgroundColor:[NSColor cyanColor]];
}

方法2：window.contentView.layer.backgroundColor

self.window.contentView.layer.backgroundColor = [NSColor cyanColor].CGColor;
self.window.contentView.wantsLayer = YES;