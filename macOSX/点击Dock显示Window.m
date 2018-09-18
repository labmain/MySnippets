- (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag {

    [window makeKeyAndOrderFront:self];

return YES;
}
