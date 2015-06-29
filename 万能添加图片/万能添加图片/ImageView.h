//
//  ImageView.h
//  万能添加图片
//
//  Created by 微我网络 on 15/6/26.
//  Copyright (c) 2015年 lamcelot. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageViewDelegate <NSObject>

- (void)selectImage:(NSInteger)indexPath;

@end
@interface ImageView : UIView
@property (nonatomic,strong)UIImageView * image;
@property (nonatomic,assign)NSInteger index;
@property (nonatomic,assign)id<ImageViewDelegate>delegate;
@end
