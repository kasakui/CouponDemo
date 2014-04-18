//
//  MarkViewController.h
//  test
//
//  Created by Kasakui on 14-1-11.
//  Copyright (c) 2014年 Kasakui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Database;

@interface MarkViewController : UITableViewController

@property (nonatomic, strong) Database *database;
@property (nonatomic, strong) NSArray *coupons;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

@end
