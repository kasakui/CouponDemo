//
//  Dao.h
//  test
//
//  Created by Kasakui on 14-1-10.
//  Copyright (c) 2014年 Kasakui. All rights reserved.
//

//#import <Foundation/Foundation.h>

#import "DBManager.h"

#import "Coupon.h"

@interface Dao : NSObject{
    FMDatabase * _db;
}

@property (nonatomic, retain) FMDatabase *db;

- (void) createDataBase;

//- (void) save:(Coupon *) coupon;

/**
 * @brief 删除一条用户数据
 *
 * @param uid 需要删除的用户的id
 */
//- (void) deleteUserWithId:(NSString *) cid;
/**
 * @brief 模拟分页查找数据。取uid大于某个值以后的limit个数据
 *
 * @param uid
 * @param limit 每页取多少个
 */
- (NSArray *) findWithCid:(NSString *) cid limit:(int) limit;

@end
