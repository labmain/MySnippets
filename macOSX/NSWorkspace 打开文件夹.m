// This should do the trick -- it assumes that you have a reference to the savePanel.

NSURL *fileURL = [savePanel URL];
NSURL *folderURL = [fileURL URLByDeletingLastPathComponent];
[[NSWorkspace sharedWorkspace] openURL: folderURL]; 

// If you are starting with an NSString containing the path, then start with:

NSURL *fileURL = [NSURL fileURLWithPath: stringContainingPath];