//
//  GKFirstViewController.m
//  GKNavigationController
//
//  Created by QuintGao on 2017/6/22.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKDemo001ViewController.h"
#import "GKDemo002ViewController.h"
#import "GKDemo005ViewController.h"

@interface GKDemo001ViewController ()<GKViewControllerPushDelegate, GKViewControllerPopDelegate>

@end

@implementation GKDemo001ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navTitle = @"控制器001";
    
    self.view.backgroundColor    = [UIColor whiteColor];
//    self.gk_navBackgroundColor   = [UIColor grayColor];
    self.gk_navBackgroundImage = [UIImage imageNamed:@"hesd_rectangular"];
    
    UIBarButtonItem *cancelBtn = [UIBarButtonItem itemWithTitle:@"取消" target:self action:@selector(dismiss)];
    self.gk_navRightBarButtonItem = cancelBtn;
    
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(100, 400, 60, 20);
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"Push" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.gk_statusBarStyle = UIStatusBarStyleLightContent;
    
    self.gk_backStyle = GKNavigationBarBackStyleWhite;
    
    self.gk_navLineHidden = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 设置左滑push代理
    self.gk_pushDelegate = self;
    
    UIView *v = [UIView new];
    v.backgroundColor = [UIColor redColor];
    v.frame = CGRectMake(100, 10, 44, 34);
    [self.gk_navigationBar addSubview:v];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.gk_popDelegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 取消左滑push代理
    self.gk_pushDelegate = nil;
    self.gk_popDelegate  = nil;
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

#pragma mark - GKNavigationControllerPushDelegate
- (void)pushToNextViewController {
    GKDemo002ViewController *demo002VC = [GKDemo002ViewController new];
    demo002VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:demo002VC animated:YES];
}

#pragma mark - GKViewControllerPopDelegate
- (void)viewControllerPopScrollBegan {
    NSLog(@"右滑开始");
}

- (void)viewControllerPopScrollUpdate:(float)progress {
    NSLog(@"右滑进度更新");
}

- (void)viewControllerPopScrollEnded {
    NSLog(@"右滑结束");
}

- (void)dismiss {
    if ([self.tabBarController isKindOfClass:[GKDemo005ViewController class]]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)btnAction {
    GKDemo002ViewController *demo002VC = [GKDemo002ViewController new];
    demo002VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:demo002VC animated:YES];
}

@end
