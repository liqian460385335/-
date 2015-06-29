//
//  WWphoto.h
//  molove
//
//  Created by 谢世忠 on 15/6/12.
//  Copyright (c) 2015年 waste. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
@interface WWphoto : NSObject

+ (WWphoto *)getinstance;
//needcut若是yes
- (void)UIimagePicker:(UIViewController *)viewcontroller cramra:(NSInteger)type needcut:(BOOL) needcut block:(void(^)(UIImage *editedImage,UIImage *originalImage)) handimgblock;
@end
