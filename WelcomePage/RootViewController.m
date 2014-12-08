//
//  RootViewController.m
//  WelcomePage
//
//  Created by wangdehuai on 14/12/8.
//  Copyright (c) 2014年 wangdehuai. All rights reserved.
//

#import "RootViewController.h"
#import "WelcomeViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    if (isFirstIn)
    {
        WelcomeViewController *welVC = [[WelcomeViewController alloc] init];
        [self presentViewController:welVC animated:NO completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
