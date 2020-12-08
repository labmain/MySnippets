// 循环一定次数
//Objective-C
for (NSInteger i = 0; i < 100; ++i) {
    NSLog(@"This will be printed 100 times.");
}

//Swift
for _ in 0 ..< 100 {
    print("This will be printed 100 times.")
}

// 在数组中循环
//Objective-C
NSArray *companies = @[@"Apple", @"Facebook", @"Twitter"];

for (NSString *name in companies) {
    NSLog(@"%@ is a well-known tech company.", name);
}

//Swift
let companies = ["Apple", "Facebook", "Twitter"]

for name in companies {
    print("\(name) is a well-known tech company.")
}