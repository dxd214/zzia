//
//  BaseViewController.m
//  WXMovie
//
//  Created by wei.chen on 13-9-4.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "BaseViewController.h"
#import "MBProgressHUD.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
        self.isModalButton = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置背景
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x.png"]];
    
    //子控制器个数大于1，则添加返回按钮
    if (self.navigationController.viewControllers.count > 1) {
        self.isBackButton = YES;
    }
    
    //添加返回按钮
    if (self.isBackButton || self.isModalButton) {
        //创建返回的按钮
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.showsTouchWhenHighlighted = YES;
        [button setImage:[UIImage imageNamed:@"backItem@2x.png"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(0, 0, 40, 44);
        
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = item;
        [item release];        
    }
}

#pragma mark - 旋转控制
//IOS5 控制旋转的开关
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return toInterfaceOrientation != UIInterfaceOrientationPortrait;
}

//IOS6 控制旋转的开关
- (BOOL)shouldAutorotate
{
    return YES;
}

//IOS6 返回支持旋转的方向
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}


//显示加载
- (void)showHUD:(NSString *)title {
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.labelText = title;
}

//隐藏加载
- (void)hideHUD {
    [self.hud hide:YES];
}


- (void)backAction {
    if (self.isBackButton) {
        [self.navigationController popViewControllerAnimated:YES];
    } else if(self.isModalButton) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

//内存警告时调用
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    //释放当前视图
    //判断当前视图是否在界面上显示，如果是显示状态，则不应该释放，如果没有显示，则释放掉，腾出新的内存
    
    //如果满足条件，则说明此视图没有在window中显示

    if ([self isViewLoaded] && self.view.window == nil) {
        self.view = nil;
        
        [self viewDidUnload];
    }        
}

/*
 ios6.0之前调用的卸载视图方法，
 此方法调用的条件:
    1.内存警告
    2.当前控制器视图没有在window中显示
 */
- (void)viewDidUnload {
    [super viewDidUnload];
}

@end
