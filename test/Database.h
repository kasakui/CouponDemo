//
//  Database.h
//  test
//
//  Created by Kasakui on 14-1-10.
//  Copyright (c) 2014年 Kasakui. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Coupon;

@interface Database : NSObject{
    
}

+ (Database*)database;

- (NSArray *)findAll;

- (NSArray *)findMark;
//收藏
-(void)mark;

//取消收藏
- (void)cancel;
@end
