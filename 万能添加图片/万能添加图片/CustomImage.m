
//
//  CustomImage.m
//  万能添加图片
//
//  Created by 微我网络 on 15/6/26.
//  Copyright (c) 2015年 lamcelot. All rights reserved.
//

#import "CustomImage.h"

@interface CustomImage ()
{
    UITapGestureRecognizer * _tap;
    UIView * _deleteView;
}
@property (nonatomic,strong)UIImageView * button;
@end
@implementation CustomImage

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self lqkininit];
    }
    return self;
}

- (void)lqkininit
{
    self.clipsToBounds = YES;
    _deleteView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.bounds), -20, 20, 20)];
    _deleteView.backgroundColor = [UIColor orangeColor];
    [_deleteView.layer setCornerRadius:10];
    [self addSubview:_deleteView];
    
    _button = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.bounds)-13, -9, 20, 20)];
    _button.userInteractionEnabled = YES;
    _button.image = [UIImage imageNamed:@"deleteimage.png"];
    [self addSubview:_button];
    _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gettap)];
    [_button addGestureRecognizer:_tap];
}

- (void)gettap
{
    NSLog(@"232233233");
}
@end
