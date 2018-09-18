#import <FMDB.h>
static FMDatabase *_db;

// 判断display字段是否存在当前table中
if (![_db columnExists:@"需要增加的字段" inTableWithName: @"表名"]) {
    NSString *sql = [NSString stringWithFormat:@"ALTER TABLE %@ ADD COLUMN %@ char NOT NULL DEFAULT ''", LocalUserNewCollectOperatorTable, @"subBody"];
    if ([_db executeUpdate:sql]) {
        NSLog(@"插入新列：LocalUserNewCollectOperatorTable！！");
    }
}