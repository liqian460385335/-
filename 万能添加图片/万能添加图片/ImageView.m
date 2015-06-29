//
//  ImageView.m
//  万能添加图片
//
//  Created by 微我网络 on 15/6/26.
//  Copyright (c) 2015年 lamcelot. All rights reserved.
//

#import "ImageView.h"


@interface ImageView ()
{
    UITapGestureRecognizer * _tap;
    UIView * _deleteView;
}
@property (nonatomic,strong)UIImageView * button;
@end
@implementation ImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        [self lqkinInit];
    }
    return self;
}

- (void)lqkinInit
{
    _image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10,CGRectGetWidth(self.bounds)-9, CGRectGetHeight(self.bounds)-9)];
    _image.backgroundColor = [UIColor orangeColor];
    [self addSubview:_image];
    
    _button = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(_image.bounds)-13, 0, 20, 20)];
    _button.userInteractionEnabled = YES;
    _button.image = [UIImage imageNamed:@"deleteimage.png"];
    [self addSubview:_button];
    _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gettap)];
    [_button addGestureRecognizer:_tap];
    
}
- (void)gettap
{
    if (_delegate && [_delegate respondsToSelector:@selector(selectImage:)]) {
        
        [_delegate selectImage:self.index];
    }
}
@end
