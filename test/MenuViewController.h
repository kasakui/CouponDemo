//
//  MenuViewController.h
//  test
//
//  Created by Kasakui on 14-1-10.
//  Copyright (c) 2014年 Kasakui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Database;

@interface MenuViewController : UITableViewController

@property (nonatomic, strong) Database *database;
@property (nonatomic, strong) NSArray *coupons;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

@end
