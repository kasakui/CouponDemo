//
//  Dao.m
//  test
//
//  Created by Kasakui on 14-1-10.
//  Copyright (c) 2014年 Kasakui. All rights reserved.
//

#import "Dao.h"

#define kUserTableName @"Coupon"


@implementation Dao

- (id) init {
    self = [super init];
    if (self) {
        //========== 首先查看有没有建立message的数据库，如果未建立，则建立数据库=========
        _db = [DBManager defaultDBManager].dataBase;
        
    }
    return self;
}

- (void) createDataBase {
    FMResultSet * set = [_db executeQuery:[NSString stringWithFormat:@"select count(*) from sqlite_master where type ='table' and name = '%@'",kUserTableName]];
    
    [set next];
    
    NSInteger count = [set intForColumnIndex:0];
    
    BOOL existTable = !!count;
    
    if (existTable) {
        // TODO:是否更新数据库
        //[AppDelegate showStatusWithText:@"数据库已经存在" duration:2];
        NSLog(@"数据库已经存在");
    } else {
        // TODO: 插入新的数据库
        NSString * sql = @"CREATE TABLE Coupon (cid INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL, name VARCHAR(50), price VARCHAR(10),mark VARCHAR(5))";
        BOOL res = [_db executeUpdate:sql];
        if (!res) {
            //[AppDelegate showStatusWithText:@"数据库创建失败" duration:2];
            NSLog(@"数据库创建失败");
        } else {
            //[AppDelegate showStatusWithText:@"数据库创建成功" duration:2];
            NSLog(@"数据库创建成功");
        }
    }
}

- (NSArray *) findWithCid:(NSString *) cid limit:(int) limit {
    NSString * query = @"SELECT cid,name,price,mark FROM Coupon";
    if (!cid) {
        query = [query stringByAppendingFormat:@" ORDER BY cid DESC limit %d",limit];
    } else {
        query = [query stringByAppendingFormat:@" WHERE cid > %@ ORDER BY cid DESC limit %d",cid,limit];
    }
    
    FMResultSet * rs = [_db executeQuery:query];
    NSMutableArray * array = [NSMutableArray arrayWithCapacity:[rs columnCount]];
	while ([rs next]) {
        Coupon * coupon = [Coupon new];
        //coupon.cid = [rs stringForColumn:@"cid"];
        coupon.name = [rs stringForColumn:@"name"];
        coupon.price = [rs stringForColumn:@"price"];
        coupon.mark = [rs stringForColumn:@"mark"];
        [array addObject:coupon];
	}
	[rs close];
    return array;
}

@end
