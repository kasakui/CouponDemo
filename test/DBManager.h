//
//  DBManager.h
//  test
//
//  Created by Kasakui on 14-1-10.
//  Copyright (c) 2014年 Kasakui. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FMDatabaseAdditions.h"

@class FMDatabase;

@interface DBManager : NSObject {
    NSString * _name;
}
/// 数据库操作对象，当数据库被建立时，会存在次序
@property (nonatomic, readonly) FMDatabase * dataBase;  // 数据库操作对象
/// 单例模式
+(DBManager *) defaultDBManager;

// 关闭数据库
- (void) close;


@end
