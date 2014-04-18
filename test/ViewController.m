//
//  ViewController.m
//  test
//
//  Created by Kasakui on 14-1-8.
//  Copyright (c) 2014年 Kasakui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *tableview1;
}


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    tableview1 = [NSArray arrayWithObjects:@"麦当劳",@"肯德基",@"必胜客",@"吉野家",@"汉堡王",@"永和大王",nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableview1 count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"tableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.image = [UIImage imageNamed:[NSString stringWithFormat:@"c%d.png",indexPath.row+1]];
    cell.textLabel.text = [tableview1 objectAtIndex:indexPath.row];
    return cell;
}

@end
