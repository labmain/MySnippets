//
//  ViewController.m
//  Sqlite数据库测试
//
//  Created by 王顺 on 16/1/13.
//  Copyright © 2016年 baihedr. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

#define DBNAME    @"personinfo.sqlite"
#define NAME      @"name"
#define AGE       @"age"
#define ADDRESS   @"address"
#define TABLENAME @"PERSONINFO"

@interface ViewController ()
{
    sqlite3 *db;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *database_path = [documents stringByAppendingPathComponent:DBNAME];
    
    // 1.sqlite3_open，如果数据不存在，则创建
    if (sqlite3_open([database_path UTF8String], &db) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库打开失败");
    }
    // 2.创建数据表PERSONINFO的语句
    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS PERSONINFO (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, address TEXT)";
    [self execSql:sqlCreateTable];

    // 3.插入数据
    NSString *sql1 = [NSString stringWithFormat:
                      @"INSERT INTO '%@' ('%@', '%@', '%@') VALUES ('%@', '%@', '%@')",
                      TABLENAME, NAME, AGE, ADDRESS, @"张三", @"23", @"西城区"];
    
    NSString *sql2 = [NSString stringWithFormat:
                      @"INSERT INTO '%@' ('%@', '%@', '%@') VALUES ('%@', '%@', '%@')",
                      TABLENAME, NAME, AGE, ADDRESS, @"老六", @"20", @"东城区"];
    [self execSql:sql1];
    [self execSql:sql2];
    
    // 4.查询数据库并打印
    NSString *sqlQuery = @"SELECT * FROM PERSONINFO";
    sqlite3_stmt * statement;
    
    if (sqlite3_prepare_v2(db, [sqlQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *name = (char*)sqlite3_column_text(statement, 1);
            NSString *nsNameStr = [[NSString alloc]initWithUTF8String:name];
            
            int age = sqlite3_column_int(statement, 2);
            
            char *address = (char*)sqlite3_column_text(statement, 3);
            NSString *nsAddressStr = [[NSString alloc]initWithUTF8String:address];
            
            NSLog(@"name:%@  age:%d  address:%@",nsNameStr,age, nsAddressStr);
        }
    }
    // 5.关闭数据库
    sqlite3_close(db);
}

// 2.创建数据库
-(void)execSql:(NSString *)sql
{
    char *err;
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库操作数据失败!");
    }
}
@end
