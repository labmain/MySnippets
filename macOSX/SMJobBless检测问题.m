Verify Following Things:

1.Code

- (BOOL)blessHelperWithLabel:(NSString *)label
                       error:(NSError **)error {

    BOOL result = NO;

    AuthorizationItem authItem      = { kSMRightBlessPrivilegedHelper, 0, NULL, 0 };
    AuthorizationRights authRights  = { 1, &authItem };
    AuthorizationFlags flags        =   kAuthorizationFlagDefaults              |
    kAuthorizationFlagInteractionAllowed    |
    kAuthorizationFlagPreAuthorize          |
    kAuthorizationFlagExtendRights;

    AuthorizationRef authRef = NULL;

    /* Obtain the right to install privileged helper tools (kSMRightBlessPrivilegedHelper). */
    OSStatus status = AuthorizationCreate(&authRights, kAuthorizationEmptyEnvironment, flags, &authRef);
    if (status != errAuthorizationSuccess) {
        NSLog(@"%@", [NSString stringWithFormat:@"Failed to create AuthorizationRef. Error code: %d", (int)status]);

    } else {
        /* This does all the work of verifying the helper tool against the application
         * and vice-versa. Once verification has passed, the embedded launchd.plist
         * is extracted and placed in /Library/LaunchDaemons and then loaded. The
         * executable is placed in /Library/PrivilegedHelperTools.
         */
        result = SMJobBless(kSMDomainSystemLaunchd, (CFStringRef)label, authRef, (CFErrorRef *)error);
    }
    return result;
}
2.Tools owned after installation field in info.plist(main app)

helper bundle : identifier helper identifier and certificate leaf[subject.CN] = "Developer ID Application: xxxxx (YYXSFDHZ6W)"
3.Clients allowed to add and remove tool field in helper info.plist.

item 0 : identifier main app bundle and certificate leaf[subject.CN] = "Developer ID Application: xxxxxx (YYXSFDHZ6W)"
4.Check MachServices filed in xxxxHelperTool-Launchd.plist.it should be

helper tool bundle : YES
