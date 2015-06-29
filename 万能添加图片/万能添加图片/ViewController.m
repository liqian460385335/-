//
//  ViewController.m
//  万能添加图片
//
//  Created by 微我网络 on 15/6/26.
//  Copyright (c) 2015年 lamcelot. All rights reserved.
//

#import "ViewController.h"
#import "ImageView.h"
#import "JTSActionSheet.h"
#import "WWphoto.h"
#import "UIColor+Hex.h"
@interface ViewController ()<ImageViewDelegate>
{
        NSMutableArray *_imageDataSource;
    UIImageView * _addimage;
    UITapGestureRecognizer * _addtap;
}
@property (nonatomic,strong)NSMutableArray * data;
@property (nonatomic,strong)UIButton * btn;

@property (nonatomic,strong)WWphoto * wwphoto;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageDataSource = [[NSMutableArray alloc]init];
    _data = [[NSMutableArray alloc]init];
    [self lqkininit];
    
    
//    [self groupView:_data view:self.btn superView:self.view photoButttonArray:_imageDataSource index_i:1 index_j:5 itemWidth:80];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)lqkininit
{
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.backgroundColor = [UIColor redColor];
    _btn.frame = CGRectMake(100, 100, 100, 30);
    
    [_btn addTarget:self action:@selector(processBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
    
    _addimage = [[UIImageView alloc]initWithFrame:CGRectMake(15, 135, 60, 60)];
    _addimage.image = [UIImage imageNamed:@"add_goodsImage.png"];
    _addimage.userInteractionEnabled  = YES;
    [self.view addSubview:_addimage];
    
    
    _addtap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapgesture)];
    [_addimage addGestureRecognizer:_addtap];
    _wwphoto = [WWphoto getinstance];
}
- (void)groupView:(NSArray *)array view:(UIView *)view superView:(UIView *)superView photoButttonArray:(NSMutableArray *)photoButttonArray index_i:(NSInteger)index_i index_j:(NSInteger)index_j itemWidth:(NSInteger)itemWidth{
    
    NSInteger space = 20;
    NSInteger width = itemWidth - space;
    //先将UIButton清空
    for (UIImageView *button in photoButttonArray) {
        [button removeFromSuperview];
    }
    //得到数组数量
    NSInteger buttonCount = array.count;
    NSInteger index = 0;
    
    //        NSInteger index_i = 3;
    //        NSInteger index_j = 4;
    for (int i = 0 ; i < index_i; i++) { //heng
        for (int j = 0; j < index_j; j++) { // shu
            
            ImageView *image = [[ImageView alloc]initWithFrame:CGRectMake(10+space/4 + width *j+j*space/2, CGRectGetMaxY(view.frame)+ 4 + i * width+i*space/2, width, width)];
            image.delegate = self;
            image.backgroundColor = [UIColor redColor];
            [superView addSubview:image];
            if (index < array.count) {
#warning  //根据实际情况进行图片的加载
                  //根据实际情况进行图片的加载
//                image.image.image = [UIImage imageNamed:array[index]];
                  image.image.image = array[index];
            }
            image.userInteractionEnabled = YES;
            image.tag = 10 + index;
            image.index = 10+index;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTapPressed:)];
            [image addGestureRecognizer:tap];
            [photoButttonArray addObject:image];
            if (index == buttonCount) {
#warning  //根据实际情况进行图片的加载
                image.image.image = [UIImage imageNamed:@"add_goodsImage.png"];
               
                image.tag = 20;
                //得到图片最下面高度
                //                _imagePhotoHeight=CGRectGetMaxY(image.frame) +10 - width;
            }
            if (index > buttonCount) {
                [image removeFromSuperview];
            }
            if (index >8) {
                [image removeFromSuperview];
            }
            index ++;
        }
        
    }
}

- (void)imageTapPressed:(UITapGestureRecognizer *)tap
{
     NSLog(@"1111111                 %ld",tap.view.tag);
    
}

#pragma maark - <ImageViewDelegate>
- (void)selectImage:(NSInteger)indexPath
{
    NSLog(@"%ld",indexPath);
    [_data removeObjectAtIndex:indexPath-10];
    //当修改图片的时候。需要重新调用改方法
    
   
    if (_data.count < 5) {
        _addimage.hidden = YES;
    }
    [UIView animateWithDuration:0.2 animations:^{
        
        _addimage.frame = CGRectMake(15 + _data.count * 70, 135, 60, 60);
    }];
    [self groupView:_data view:self.btn superView:self.view photoButttonArray:_imageDataSource index_i:1 index_j:_data.count itemWidth:80];
    
}


- (void)addimageWithimage:(UIImage *)image
{
    [_data addObject:image];
    if (_data.count > 4) {
        _addimage.hidden = YES;
    }
    [UIView animateWithDuration:0.2 animations:^{
        
        _addimage.frame = CGRectMake(15 + _data.count * 70, 135, 60, 60);
    }];
    [self groupView:_data view:self.btn superView:self.view photoButttonArray:_imageDataSource index_i:1 index_j:_data.count itemWidth:80];
    
}
- (void)processBtn
{
    NSLog(@"xxxxx");
}

- (void)tapgesture
{
    
    //添加商品封面
    JTSActionSheetTheme * theme = [JTSActionSheetTheme defaultTheme];
    theme.titleColor = [UIColor colorWithHexString:@"33ccbf"];
    theme.destructiveButtonColor = [UIColor colorWithHexString:@"33ccbf"];
    theme.normalButtonColor =[UIColor colorWithHexString:@"33ccbf"];
    JTSActionSheetItem * buyall = [JTSActionSheetItem itemWithTitle:@"拍照" action:^{
        
        //判断拍照
        [_wwphoto UIimagePicker:self cramra:1 needcut:NO block:^(UIImage *editedImage, UIImage *originalImage) {
            NSLog(@"拍照");
                [self addimageWithimage:originalImage];
                    }];
        
    } isDestructive:NO];
    JTSActionSheetItem * deletall = [JTSActionSheetItem itemWithTitle:@"从相册中选择" action:^{
        //判断从相册
        //需要裁剪的图片
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor blackColor];
        [_wwphoto UIimagePicker:self cramra:0 needcut:NO block:^(UIImage *editedImage, UIImage *originalImage) {
                       NSLog(@"相册");
            [self addimageWithimage:originalImage];
            
        }];
        
        
    } isDestructive:NO];
    
    JTSActionSheetItem * cancel = [JTSActionSheetItem itemWithTitle:@"返回" action:^{
        
    } isDestructive:NO];
    
    JTSActionSheet * sheet = [[JTSActionSheet alloc]initWithTheme:theme title:nil actionItems:@[buyall,deletall] cancelItem:cancel];
    [sheet showInView:self.view];
}




@end
