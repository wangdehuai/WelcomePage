//
//  WelcomeViewController.m
//  WelcomePage
//
//  Created by wangdehuai on 14/12/8.
//  Copyright (c) 2014年 wangdehuai. All rights reserved.
//

#import "WelcomeViewController.h"

#define PIC_num             3
#define BTN_width           120
#define BTN_height          50
#define BTN_margin_bottom   150
#define BTN_title           @"立即体验"

@interface WelcomeViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scrollV;
    UIPageControl *pageControl;
    UIImageView *imageView;
}
@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置成yes以后再也不进入
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstStart"];
    [self creataWealcom];
}

-(void)creataWealcom
{
    int picNum = 3;
    
    scrollV = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    [scrollV setShowsHorizontalScrollIndicator:NO];
    [scrollV setPagingEnabled:YES];
    scrollV.delegate = self;
    [scrollV setContentSize:CGSizeMake(KScreenWidth*picNum, KScreenHeight)];
    
    for (int i = 0; i < picNum; i++) {
        UIView * picView = [[UIView alloc]initWithFrame:CGRectMake(KScreenWidth*i, 0, KScreenWidth, KScreenHeight)];
        [picView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",picNum]]]];
        [scrollV addSubview:picView];
    }
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btn setBackgroundColor:[UIColor blackColor]];
    [_btn setTitle:BTN_title forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(goIndexTo) forControlEvents:UIControlEventTouchUpInside];
    [_btn setFrame:CGRectMake(KScreenWidth*picNum - KScreenWidth/2 - BTN_width/2, KScreenHeight - BTN_margin_bottom, BTN_width, BTN_height)];
    
    [scrollV addSubview:_btn];
    [self.view addSubview:scrollV];
    
    pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, KScreenHeight-60, KScreenWidth, 37)];
    pageControl.numberOfPages = picNum;
    pageControl.pageIndicatorTintColor = [UIColor colorWithRed:237.f/255 green:237.f/255 blue:237.f/255 alpha:1];
    pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:86.f/255 green:187.f/255 blue:209.f/255 alpha:1];
    [self.view addSubview:pageControl];
}
#pragma mark - scroll view data source
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    pageControl.currentPage = (KScreenWidth/2 + scrollView.contentOffset.x)/KScreenWidth;
}
-(void)goIndexTo
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
