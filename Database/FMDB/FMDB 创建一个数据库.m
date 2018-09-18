#import "EHUserLocalNewListenCountOperator.h"
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
#import "EHOfflineDataOperator.h"
#import <FMDB.h>
static FMDatabaseQueue *_dbQueue;
@implementation EHUserLocalNewListenCountOperator
+ (void)initialize
{
    _dbQueue = [self sharedDataBase];

    if (_dbQueue) {
        [_dbQueue inDatabase:^(FMDatabase *db) {
            if ([db open]) {
                // 创建表
                BOOL success = [db executeUpdate:@""];
                
                if (success) {
                    NSLog(@"--------------打开xx录表成功--------------");
                } else {
                    NSLog(@"--------------打开xx录表失败--------------");
                }
            }
        }];
    }
}

+ (FMDatabaseQueue *)sharedDataBase
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 获取沙盒路径
        NSString *path = PATH_OF_DOCUMENT;
        NSString *fileName = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite", LocalUserNewLocalListenCountTable]];

        // 创建数据库
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:fileName];
    });

    return _dbQueue;
}

/** 添加或更新一个精听数据 */
+ (BOOL)addUserListenDataForSqliteWithObject:(userLocalListenOperator *)aListenObject
{
    NSString *sql = nil;
    if ([self findMasterStatusForSqliteWithObject:aListenObject]) {
        // 更新精听数据
        sql = @"";
        __block BOOL bResult = NO;
        [_dbQueue inDatabase:^(FMDatabase *db) {
            if ([db open]) {
                bResult = [db executeUpdate:sql];
            }
        }];
        return bResult;

    } else {
        // 添加
        sql = @"";
        __block BOOL bResult = NO;
        [_dbQueue inDatabase:^(FMDatabase *db) {
            if ([db open]) {
                bResult = [db executeUpdate:sql];
            }
        }];
        return bResult;
    }
}

/** 是否有这条记录 */
+ (BOOL)findMasterStatusForSqliteWithObject:(userLocalListenOperator *)aListenObject
{
    NSString *sql = @"";
    __block BOOL result = NO;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            FMResultSet *rs = [db executeQuery:sql];
            while ([rs next]) {
                result = YES;
                break;
            }
            [rs close];
        }
    }];
    return result;
}

@end