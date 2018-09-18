XWCommonHttpTool.h
#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface XWCommonHttpTool : AFHTTPSessionManager

+ (instancetype)sharedNetworkTools;

@end


XWCommonHttpTool.m
#import "XWCommonHttpTool.h"

@implementation XWCommonHttpTool

+(instancetype)sharedNetworkTools
{
    static XWCommonHttpTool *httpTool;
    static dispatch_once_t onceToekn;
    //单例
    dispatch_once(&onceToekn, ^{
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/"];
        NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
        httpTool=[[self alloc]initWithBaseURL:url sessionConfiguration:config];    
        httpTool.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];     
    });
    return httpTool;
}
@end


XWDataCacheTool.h
#import <Foundation/Foundation.h>

@interface XWDataCacheTool : NSObject

+(void)addArr:(NSArray*)arr andId:(NSString*)idstr;
+(void)addDict:(NSDictionary*)dict andId:(NSString*)idstr;

+(NSArray*)dataWithID:(NSString*)ID;
+(void)deleteWidthId:(NSString*)ID;

@end


XWDataCacheTool.m
#import "XWDataCacheTool.h"
#import "FMDB.h"

static FMDatabaseQueue *_queue;

@implementation XWDataCacheTool

/**
 唐巧的技术博客
 http://blog.devtang.com/blog/2012/04/22/use-fmdb/

 如果我们的 app 需要多线程操作数据库，那么就需要使用 FMDatabaseQueue 来保证线程安全了。 切记不能在多个线程中共同一个 FMDatabase 对象并且在多个线程中同时使用，这个类本身不是线程安全的，这样使用会造成数据混乱等问题。

 使用 FMDatabaseQueue 很简单，首先用一个数据库文件地址来初使化 FMDatabaseQueue，然后就可以将一个闭包 (block) 传入 inDatabase 方法中。 在闭包中操作数据库，而不直接参与 FMDatabase 的管理。
 */

+(void)initialize
{
    NSString *path= [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"news.sqlite"];
    _queue=[FMDatabaseQueue databaseQueueWithPath:path];
    //创建表
    [_queue inDatabase:^(FMDatabase *db) {
        BOOL b=[db executeUpdate:@"create table if not exists info(ID integer primary key autoincrement,data blob,idstr text)"];
        if(!b){
            NSLog(@"创建表失败");
        }
    }];
   // NSLog(@"%@",path);
}

+(void)addArr:(NSArray *)arr andId:(NSString *)idstr
{
    //NSLog(@"data   %@",idstr);
    for(NSDictionary *dict in arr) {
        [self addDict:dict andId:idstr];
    }
}
+(void)addDict:(NSDictionary *)dict andId:(NSString *)idstr
{
    [_queue inDatabase:^(FMDatabase *db) {
            NSData *data=[NSKeyedArchiver archivedDataWithRootObject:dict];
            [db executeUpdate:@"insert into info(data,idstr) values(?,?)",data,idstr];          
    }];    
}
//返回数组
+(NSArray *)dataWithID:(NSString *)ID
{
    __block NSMutableArray *arr=nil;
    [_queue inDatabase:^(FMDatabase *db) {     
        FMResultSet *result=[db executeQuery:@"select * from info where idstr=?",ID];
        if(result){
            arr=[NSMutableArray array];
            while ([result next]) {
                NSData *data=[result dataForColumn:@"data"];
                // NSString *idstr=[result stringForColumn:@"idstr"];
                //转成字典
                NSDictionary *dict=[NSKeyedUnarchiver unarchiveObjectWithData:data];
                [arr addObject:dict];
            }
        }       
    }];
    return arr;
}
#pragma mark 删除对应的数据
+(void)deleteWidthId:(NSString *)ID
{  
    [_queue inDatabase:^(FMDatabase *db) {
        //delete from info where idstr='T1348648517839'
        BOOL b=[db executeUpdate:@"delete  from info where idstr=?",ID];
        if(!b){
            NSLog(@"删除失败");
        }
    }];    
}
@end