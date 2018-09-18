#import "FMDatabaseQueue.h"

+ (void)initialize
{
    // 创建数据库
    _DataBaseQueue = [self sharedDataBase];
    [_DataBaseQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            // 创建表
            BOOL success = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS EHCloudSyncTimeOpraterTabel(id INTEGER PRIMARY KEY AUTOINCREMENT, uid INTEGER, cloudName TEXT,syncTime TEXT);"];
            if (success) {
                NSLogOK(@"--------------打开EHCloudSyncTimeOpraterTabel表成功--------------");
            } else {
                NSLogError(@"--------------打开EHCloudSyncTimeOpraterTabel表失败！--------------");
            }
        }
    }];
}

+ (FMDatabaseQueue *)sharedDataBase
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 获取沙盒路径
        NSString *path = PATH_OF_DOCUMENT;
        NSString *fileName = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite", EHCloudSyncTimeOpraterTable]];
        // 创建数据库
        _DataBaseQueue = [FMDatabaseQueue databaseQueueWithPath:fileName];
    });
    return _DataBaseQueue;
}


+ (BOOL)findrandomCollectForSqliteWithObject:(NSDictionary *)mCollectObject
{
    __block BOOL result = NO;
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE uid = '%@' and cloudName = '%@' ", EHCloudSyncTimeOpraterTable, [EHUserInfoObject sharedInstance].mUserID, mCollectObject[@"cloudName"]];
    [_DataBaseQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            result = YES;
            break;
        }
        [rs close];// 记得要关闭掉，不然会有警告
    }];
    return result;
}

+ (NSString *)findSyncTimeObjectWithCloudName:(EHCloudSyncTimeName *)cloudName
{
   __block NSString *syncTime = nil;
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE uid = '%@' AND cloudName = '%@'", EHCloudSyncTimeOpraterTable, [EHUserInfoObject sharedInstance].mUserID, cloudName];
    
    [_DataBaseQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            syncTime = [rs stringForColumn:@"syncTime"];
            break;
        }
        [rs close];
    }];

    return syncTime;
}