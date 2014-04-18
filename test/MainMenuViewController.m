//
//  MainMenuViewController.m
//  test
//
//  Created by Kasakui on 14-1-10.
//  Copyright (c) 2014年 Kasakui. All rights reserved.
//

#import "MainMenuViewController.h"

#import "IBCellFlipSegue.h"

#import "Globals.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _DB = [[Dao alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //tableview2 = [NSArray arrayWithObjects:@"麦当劳",@"肯德基",nil];
    //Dao *db = [[Dao alloc] init];
    [_DB createDataBase];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self._Data = [[FMDatabase DB] ];
    [self.tableView reloadData];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [__Data count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TableIdentifier = @"tableCell2";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableIdentifier];
    
    //if (cell == nil) {
    //    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableIdentifier];
    //}
    
    Coupon *coupon = [__Data objectAtIndex:indexPath.row];
    cell.textLabel.text = coupon.name;
    cell.textLabel.text = coupon.price;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:kSegueDetails sender:[tableView cellForRowAtIndexPath:indexPath]];
     //Coupon *coupon = [_Data objectAtIndex:indexPath.row];
}





- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue isMemberOfClass:[IBCellFlipSegue class]])
    {
        IBCellFlipSegue *cellFlipSegue = (IBCellFlipSegue *)segue;
        cellFlipSegue.selectedCell = sender;
        cellFlipSegue.flipAxis = FlipAxisVertical;
    }
}
@end
