//
//  PhotoScrollView.m
//  07 Task
//
//  Created by lyb on 14-10-7.
//  Copyright (c) 2014年 imac. All rights reserved.
//

#import "PhotoScrollView.h"

@implementation PhotoScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        //数据不能在这里设置
//        _imageView.image = _image;
        
        [self addSubview:_imageView];
        
        //设置最大放大倍数
        self.maximumZoomScale = 2.0;
        //设置最小缩小倍数
        self.minimumZoomScale = .5;
        
        //隐藏滚动条
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        //设置代理
        self.delegate = self;
        
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapActoin:)];
        tap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

//手势响应事件
- (void)tapActoin:(UITapGestureRecognizer *)tap {

    if (self.zoomScale > 1) {
        //缩小
        [self setZoomScale:1 animated:YES];
    }else {
        //放大
        [self setZoomScale:2 animated:YES];
    }
    
}

- (void)setImage:(UIImage *)image {

    _image = image;
    
    _imageView.image = _image;
}

#pragma mark - UIScrollView delegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {

    return _imageView;
}



@end
