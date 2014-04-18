//
//  DetailsViewController.m
//  test
//
//  Created by Kasakui on 14-1-10.
//  Copyright (c) 2014年 Kasakui. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIButton+Bootstrap.h"
#import "SJAvatarBrowser.h"

#import "Database.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

-(IBAction)mark:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:@"收藏成功！"
                                                   delegate:self
                                          cancelButtonTitle:@"好"
                                          otherButtonTitles:nil];
    [alert show];
    [[Database database] mark];
}

- (IBAction)showAvatar:(UITapGestureRecognizer*)sender
{
    [SJAvatarBrowser showImage:(UIImageView*)sender.view];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    [self.dangerButton dangerStyle];
    [self.favoriteButton warningStyle];
    [self.favoriteButton addAwesomeIcon:FAIconStar beforeTitle:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickedDismissButton:(id)sender {
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:NULL];
}

@end
