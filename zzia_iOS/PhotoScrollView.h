//
//  PhotoScrollView.h
//  07 Task
//
//  Created by lyb on 14-10-7.
//  Copyright (c) 2014年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView<UIScrollViewDelegate>
{
    UIImageView *_imageView;
}

@property(nonatomic, retain)UIImage *image;

@end
