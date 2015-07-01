//
//  BaseViewController.h
//  WXMovie
//
//  Created by wei.chen on 13-9-4.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXDataService.h"

@class MBProgressHUD;
@interface BaseViewController : UIViewController

//是否添加返回按钮
@property(nonatomic,assign)BOOL isBackButton;

//是否添加模态按钮
@property(nonatomic,assign)BOOL isModalButton;

@property(nonatomic,retain) MBProgressHUD *hud;

//显示加载
- (void)showHUD:(NSString *)title;
//隐藏加载
- (void)hideHUD;

@end
