// 创建数据库
FMDatabase *db = [FMDatabase databaseWithPath:@"/tmp/tmp.db"];
// 打开数据库
[db open];

// 执行查找
FMResultSet *s = [db executeQuery:@"SELECT * FROM myTable"];
while ([s next]) {
    //retrieve values for each record
}
FMResultSet *s = [db executeQuery:@"SELECT COUNT(*) FROM myTable"];
if ([s next]) {
    int totalCount = [s intForColumnIndex:0];
}

// 对应的objective-c的数据方式有：
intForColumn:
longForColumn:
longLongIntForColumn:
boolForColumn:
doubleForColumn:
stringForColumn:
dateForColumn:
dataForColumn:
dataNoCopyForColumn:
UTF8StringForColumnName:
objectForColumnName:

// 关闭数据库
[db close];

// 事物相关
NSString *sql = @"create table bulktest1 (id integer primary key autoincrement, x text);"
                 "create table bulktest2 (id integer primary key autoincrement, y text);"
                 "create table bulktest3 (id integer primary key autoincrement, z text);"
                 "insert into bulktest1 (x) values ('XXX');"
                 "insert into bulktest2 (y) values ('YYY');"
                 "insert into bulktest3 (z) values ('ZZZ');";

success = [db executeStatements:sql];

sql = @"select count(*) as count from bulktest1;"
       "select count(*) as count from bulktest2;"
       "select count(*) as count from bulktest3;";

success = [self.db executeStatements:sql withResultBlock:^int(NSDictionary *dictionary) {
    NSInteger count = [dictionary[@"count"] integerValue];
    XCTAssertEqual(count, 1, @"expected one record for dictionary %@", dictionary);
    return 0;
}];

// 常用数据插入
NSDictionary *argsDict = [NSDictionary dictionaryWithObjectsAndKeys:@"My Name", @"name", nil];
[db executeUpdate:@"INSERT INTO myTable (name) VALUES (:name)" withParameterDictionary:argsDict];
[db executeUpdate:@"INSERT INTO myTable VALUES (?)", @"this has \" lots of ' bizarre \" quotes '"];
[db executeUpdate:@"INSERT INTO myTable VALUES (?)", 42];
[db executeUpdateWithFormat:@"INSERT INTO myTable VALUES (%d)", 42];


// 更常用的使用FMDatabaseQueue来安全的操作
FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:aPath];
[queue inDatabase:^(FMDatabase *db) {
    [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:1]];
    [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:2]];
    [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:3]];

    FMResultSet *rs = [db executeQuery:@"select * from foo"];
    while ([rs next]) {
        …
    }
}];

[queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
    [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:1]];
    [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:2]];
    [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:3]];

    if (whoopsSomethingWrongHappened) {
        *rollback = YES;
        return;
    }
    // etc…
    [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:4]];
}];
