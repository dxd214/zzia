//
//  GuideViewController.m
//  WXMovie
//
//  Created by wei.chen on 13-9-10.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "GuideViewController.h"
#import "MainTabbarController.h"

@interface GuideViewController ()<UIScrollViewDelegate>

@end

@implementation GuideViewController

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
    
    //隐藏状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    NSArray *guideImages = @[
                             @"guide1@2x.png",
                             @"guide2@2x.png",
                             @"guide3@2x.png",
                             @"guide4@2x.png",
                             @"guide5@2x.png"
                            ];
    NSArray *progressImages = @[
                                @"guideProgress1@2x.png",
                                @"guideProgress2@2x.png",
                                @"guideProgress3@2x.png",
                                @"guideProgress4@2x.png",
                                @"guideProgress5@2x.png"
                               ];
    
    UIScrollView *sv = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    sv.showsHorizontalScrollIndicator = NO;
    sv.showsVerticalScrollIndicator = NO;
    sv.contentSize = CGSizeMake(kScreenWidth*guideImages.count, kScreenHeight);
    sv.pagingEnabled = YES;
    sv.delegate = self;
    [self.view addSubview:sv];
    
    for (int i=0; i<guideImages.count; i++) {
        NSString *guideImageName = guideImages[i];
        NSString *progressImageName = progressImages[i];
        
        //创建操作指南图片视图
        UIImageView *guideImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:guideImageName]];
        guideImageView.frame = CGRectMake(kScreenWidth*i, 0, kScreenWidth, kScreenHeight);
        [sv addSubview:guideImageView];
        
        //创建进度视图
        UIImageView *progressImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:progressImageName]];
        progressImageView.frame = CGRectMake((kScreenWidth-173.0/2)/2, kScreenHeight-26.0/2-30, 173.0/2, 26.0/2);
        [guideImageView addSubview:progressImageView];
        
        [guideImageView release];
        [progressImageView release];
    }
    
}


#pragma mark - UIScrollView delegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    //滑动到末尾，这两个值是相等的：
    //scrollView.contentOffset.x == scrollView.contentSize.width-scrollView.width

    float sub = scrollView.contentOffset.x - (scrollView.contentSize.width-scrollView.width);
    
    if (sub > 30) {
        
        //显示状态栏
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        
//        UIWindow *window = [UIApplication sharedApplication].keyWindow;

        MainTabbarController *mainCtrl = [[[MainTabbarController alloc] init] autorelease];
        /*
          如果视图view直接或间接的显示在window上，则通过view.window能获取到window对象
         */
        self.view.window.rootViewController = mainCtrl;
        
        //放大动画
        mainCtrl.view.transform = CGAffineTransformMakeScale(0.01, 0.01);
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.6];
        mainCtrl.view.transform = CGAffineTransformIdentity;
        [UIView commitAnimations];
        
    }
    
}

@end
