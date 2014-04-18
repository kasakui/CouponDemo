//
//  Database.m
//  test
//
//  Created by Kasakui on 14-1-10.
//  Copyright (c) 2014年 Kasakui. All rights reserved.
//

#import "Database.h"

#import "FMDatabase.h"

#import "Coupon.h"

@implementation Database

static Database *_database;

+ (Database*)database {
    if (_database == nil) {
        _database = [[Database alloc] init];
    }
    return _database;
}

- (NSString *)databasePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = paths[0];
    return [documentsDirectory stringByAppendingPathComponent:@"coupon.sqlite"];
}

- (id)init {
    if ((self = [super init])) {
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *filePath = [self databasePath];
        if (![fileManager fileExistsAtPath:filePath]) {
            NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"coupon"
                                                                 ofType:@"sqlite"];
            [fileManager copyItemAtPath:sqLiteDb
                                 toPath:filePath
                                  error:NULL];
        }
        
    }
    return self;
}

- (NSArray *)findAll
{
    NSMutableArray *coupons = [NSMutableArray array];
    FMDatabase *database = [FMDatabase databaseWithPath:[self databasePath]];
    [database open];
    
    FMResultSet *resultSet = [database executeQuery:@"SELECT * from Coupon"];
    
    while ([resultSet next]) {
        
        Coupon *coupon = [[Coupon alloc]init];
        
        coupon.cid = [resultSet intForColumn:@"cid"];
        coupon.name = [resultSet stringForColumn:@"name"];
        coupon.price  = [resultSet stringForColumn:@"price"];
        
        [coupons addObject:coupon];
        
    }
    
    [database close];
    
    return coupons;
}

- (NSArray *)findMark
{
    NSMutableArray *coupons = [NSMutableArray array];
    FMDatabase *database = [FMDatabase databaseWithPath:[self databasePath]];
    [database open];
    
    FMResultSet *resultSet = [database executeQuery:@"SELECT cid,name,price from Coupon where mark ='1'"];
    
    while ([resultSet next]) {
        
        Coupon *coupon = [[Coupon alloc]init];
        
        coupon.cid = [resultSet intForColumn:@"cid"];
        coupon.name = [resultSet stringForColumn:@"name"];
        coupon.price  = [resultSet stringForColumn:@"price"];
        
        [coupons addObject:coupon];
        
    }
    
    [database close];
    
    return coupons;
}
-(void)mark
{
    FMDatabase *database = [FMDatabase databaseWithPath:[self databasePath]];
    [database open];
    NSString * query = [NSString stringWithFormat:@"update coupon set mark = '1' where cid=1"];
    [database executeUpdate:query];
    [database close];
}

-(void)cancel
{
    FMDatabase *database = [FMDatabase databaseWithPath:[self databasePath]];
    [database open];
    NSString * query = [NSString stringWithFormat:@"update coupon set mark = '0' where cid=1"];
    [database executeUpdate:query];
    [database close];
}
@end
