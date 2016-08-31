//
//  RiJiBiao.m
//  十二星座
//
//  Created by tarena on 16/6/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RiJiBiao.h"
#import "PhotoBroswerVC.h"
@implementation RiJiBiao
-(void)awakeFromNib
{
    //自动布局
    for (UIImageView* vi in self.AiQingZiDongBuJu) {
        vi.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/375*vi.frame.origin.x, [UIScreen mainScreen].bounds.size.height/667*vi.frame.origin.y, [UIScreen mainScreen].bounds.size.width/375*vi.frame.size.width,self.XinQingBeiJing.bounds.size.height);
    }
    for (UILabel* vi in self.ZiTiZiDongBuJu) {
        vi.font = [UIFont systemFontOfSize:[UIScreen mainScreen].bounds.size.width/375*17];
    }
    self.XIngQiZiDongBuJu.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/375*self.XIngQiZiDongBuJu.frame.origin.x, [UIScreen mainScreen].bounds.size.height/667*self.XIngQiZiDongBuJu.frame.origin.y, [UIScreen mainScreen].bounds.size.width/375*self.XIngQiZiDongBuJu.frame.size.width,self.XinQingBeiJing.bounds.size.height);
    

}
-(void)setWenzhang:(RiJiWenZhang *)wenzhang
{
    _wenzhang = wenzhang;
     self.ZhaoPian.image =wenzhang.image;
    self.RiQi.text =wenzhang.ShiJian;
    self.WenZhang.text = wenzhang.WenBen;
    self.TianQI.text = wenzhang.TianQi;
    self.ZhaoPian.layer.masksToBounds =
    self.XingBeiJing.layer.masksToBounds =
    self.XinQingBeiJing.layer.masksToBounds =
    self.XingQingZhiShu.layer.masksToBounds =
    self.AiQingXing.layer.masksToBounds = YES;
    self.ZhaoPian.layer.cornerRadius = 10;
    self.ZhaoPian.layer.borderWidth = 3;
    self.ZhaoPian.layer.borderColor = [UIColor whiteColor].CGColor;
    self.XinQingBeiJing.layer.cornerRadius = 5;
        [UIView animateWithDuration:1 animations:^{
        self.AiQingXing.frame = CGRectMake(self.AiQingXing.frame.origin.x, self.AiQingXing.frame.origin.y, self.XingBeiJing.frame.size.width*wenzhang.AiQing, self.AiQingXing.frame.size.height);
        self.XingQingZhiShu.frame = CGRectMake(self.XingQingZhiShu.frame.origin.x, self.XingQingZhiShu.frame.origin.y, self.XingBeiJing.frame.size.width*wenzhang.XinQing, self.XingQingZhiShu.frame.size.height);

    }];
    self.ary = [NSMutableArray array];
    [self.ary addObject:self.ZhaoPian];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.ZhaoPian addGestureRecognizer:tap];
}
//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}
-(void)tapAction:(UITapGestureRecognizer *)tap
{
    [[self getCurrentVC].view endEditing:YES];
    UIImageView *iv = (UIImageView *)tap.view;
    //[UIApplication sharedApplication].keyWindow.rootViewController 得到的是当前程序window的根页面
    [PhotoBroswerVC show:[UIApplication sharedApplication].keyWindow.rootViewController type:PhotoBroswerVCTypeZoom index:iv.tag photoModelBlock:^NSArray *{
        
        NSMutableArray *modelsM = [NSMutableArray arrayWithCapacity:self.ary.count];
        
        
        for (NSUInteger i = 0; i<self.ary.count; i++) {
            PhotoModel *pbModel=[[PhotoModel alloc] init];
            pbModel.mid = arc4random()%1000000;
        
            
            //设置查看大图的时候的图片地址
            pbModel.image = ((UIImageView*)self.ary[i]).image;
            
            //源图片的frame
            UIImageView *imageV =(UIImageView *) self.ary[i];
            pbModel.sourceImageView = imageV;
            [modelsM addObject:pbModel];
        }
        return modelsM;
    }];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
