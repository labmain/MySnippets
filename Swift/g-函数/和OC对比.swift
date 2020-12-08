// 不接收参数也没有返回的函数

//Objective-C
- (void)printGreeting {
    NSLog(@"Hello!");
}
[self printGreeting];


//Swift
func printGreeting() {
    print("Hello!")
}
printGreeting()


// 不接收参数，返回一个字符串的函数

//Objective-C
- (NSString*)printGreeting {
    return @"Hello!";
}
NSString *result = [self printGreeting];


//Swift
func printGreeting() -> String {
    return "Hello!"
}
let result = printGreeting()


// 接收一个字符串，返回一个字符串的函数

//Objective-C
- (NSString*)printGreetingFor:(NSString*)user {
    return [NSString stringWithFormat:@"Hello, %@!", user];
}

NSString *result = [self printGreetingFor:@"Paul"];
//第一个参数的名称需要为方法名的一部分


//Swift
func printGreeting(for user: String) -> String {
    return "Hello, \(user)!"
}

let result = printGreeting(for: "Paul")


// 接收一个字符串和一个整数，返回一个字符串的函数

//Objective-C
- (NSString*)printGreetingFor:(NSString*)user withAge:(NSInteger)age {
    if (age >= 18) {
        return [NSString stringWithFormat:@"Hello, %@! You're an adult.", user];
    } else {
        return [NSString stringWithFormat:@"Hello, %@! You're a child.", user];
    }
}

NSString *result = [self printGreetingFor:@"Paul" withAge:38];


//Swift
func printGreeting(for user: String, age: Int) -> String {
    if age >= 18 {
        return "Hello, \(user) You're an adult."
    } else {
        return "Hello, \(user)! You're a child."
    }
}

let result = printGreeting(for: "Paul", age: 38)


// 从函数返回多个值

//Objective-C
- (NSDictionary*)loadAddress {
    return @{
        @"house": @"65, Park Street",
        @"city": @"Bristol",
        @"country": @"UK"
    };
}

NSDictionary*address = [self loadAddress];
NSString *house = address[@"house"];
NSString *city = address[@"city"];
NSString *country = address[@"country"];
//Objective-C不支持元祖(tuple),所以用字典或数组替代


//Swift
func loadAddress() -> (house: String, city: String, country: String) {
    return ("65, Park Street", "Bristol", "UK")
}

let (city, street, country) = loadAddress()