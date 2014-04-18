//
//  MainMenuViewController.h
//  test
//
//  Created by Kasakui on 14-1-10.
//  Copyright (c) 2014年 Kasakui. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DBManager.h"

#import "Coupon.h"

#import "Dao.h"

@interface MainMenuViewController : UITableViewController

@property (strong,nonatomic) Dao *DB;

@property (strong,nonatomic) NSMutableArray *_Data;
@end
