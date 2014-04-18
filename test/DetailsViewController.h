//
//  DetailsViewController.h
//  test
//
//  Created by Kasakui on 14-1-10.
//  Copyright (c) 2014年 Kasakui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Database;

@interface DetailsViewController : UIViewController

- (IBAction)didClickedDismissButton:(id)sender;

- (IBAction)mark:(id)sender;

@property (nonatomic, strong) Database *database;

@property (strong, nonatomic) IBOutlet UIButton *dangerButton;

@property (strong, nonatomic) IBOutlet UIButton *favoriteButton;



@end
