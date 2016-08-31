//
//  MyTabbar.m
//  达内微博
//
//  Created by tarena on 16/6/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MyTabbar.h"
#import "HuangLi.h"
#import "ZhouGongJieMeng.h"
#import "MyNabigationController.h"
@interface MyTabbar ()
@property(nonatomic,strong)UIView* view;
@property(nonatomic,strong)UIView* view1;
@property(nonatomic,strong)UIButton* bnt;
@property(nonatomic,assign) BOOL XianShi;
@property(nonatomic,strong) UIVisualEffectView* MoHu;
@end
@implementation MyTabbar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //添加进去+按钮
        
        UIButton *sendWeiboBtn = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-20, 5, 40, 40)];
        sendWeiboBtn.layer.masksToBounds = YES;
        sendWeiboBtn.layer.cornerRadius = sendWeiboBtn.bounds.size.width/2;
        [sendWeiboBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted.png"] forState:UIControlStateNormal];
        //设置背景图片
        [sendWeiboBtn setBackgroundColor:[UIColor orangeColor]];
        
        [sendWeiboBtn setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:sendWeiboBtn];
        [sendWeiboBtn addTarget:self action:@selector(sendAction:) forControlEvents:UIControlEventTouchUpInside];
        self.bnt =sendWeiboBtn;
        
    }
    return self;
}

-(void)sendAction:(UIButton*)but
{

    if (self.XianShi == YES) {
          self.MoHu.hidden = YES;
        [UIView animateWithDuration:0.5 animations:^{
            self.view1.center = self.view.center = self.center;
            self.view1.alpha = self.view.alpha = 0;
            self.XianShi = NO;
            but.transform =  CGAffineTransformRotate(but.transform, -M_PI/4);
        }];
    }
    else
    {
           self.MoHu.hidden = NO;
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.view.frame = CGRectMake(0,0, 55, 55);
            self.view.center = CGPointMake(self.center.x-65,self.center.y-90);
            self.view.alpha = 1;
            self.view1.frame = CGRectMake(0,0, 55, 55);
            self.view1.center = CGPointMake(self.center.x+80,self.center.y-90);
            self.view1.alpha = 1;
            self.XianShi = YES;
           but.transform =  CGAffineTransformRotate(but.transform, M_PI/4);
             } completion:^(BOOL finished) {
             }];
    }
    
    if (self.view == nil)
    {
        self.MoHu = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(self.superview.frame.origin.x, self.superview.frame.origin.y, self.superview.frame.size.width, self.superview.frame.size.height-49)];
        //点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [self.MoHu addGestureRecognizer:tap];

        UIBlurEffect* blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        self.MoHu.effect = blur;
        self.view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        self.view.alpha = 0;
        self.view.center = self.center;
        UIButton* but = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40,40)];
        but.layer.masksToBounds = YES;
        but.layer.borderWidth = 1;
        but.layer.borderColor = [UIColor whiteColor].CGColor;
        [but addTarget:self action:@selector(HuangLi:) forControlEvents:UIControlEventTouchUpInside];
        [but setBackgroundImage:[UIImage imageNamed:@"bagua"] forState:UIControlStateNormal];
        but.layer.cornerRadius = but.bounds.size.width/2;
        UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(0, 45,40,10)];
        label.text = @"黄  历";
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = 1;
        label.textColor = [UIColor whiteColor];
        [self.superview addSubview:self.MoHu];
        [self.view addSubview:label];
        [self.view addSubview:but];
        [self.superview addSubview:self.view];

        self.view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        self.view1.alpha = 0;
        self.view1.center = self.center;
        UIButton* but1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40,40)];
        but1.layer.masksToBounds = YES;
        but1.layer.borderWidth = 1;
        [but1 addTarget:self action:@selector(ZhouGongJieMeng:) forControlEvents:UIControlEventTouchUpInside];
        [but1 setBackgroundImage:[UIImage imageNamed:@"jiemeng"] forState:UIControlStateNormal];
        but1.layer.cornerRadius = but1.bounds.size.width/2;
        UILabel* label1 = [[UILabel alloc]initWithFrame:CGRectMake(-10, 45,60,10)];
        label1.text = @"周公解梦";
        label1.font = [UIFont systemFontOfSize:14];
        label1.textAlignment = 1;
        label1.textColor = [UIColor whiteColor];
        [self.view1 addSubview:label1];
        [self.view1 addSubview:but1];
        [self.superview addSubview:self.view1];
        
        self.XianShi = YES;
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.view.frame = CGRectMake(0,0, 55, 55);
            self.view.center = CGPointMake(self.center.x-65,self.center.y-90);

            self.view.alpha = 1;
            self.view1.frame = CGRectMake(0,0, 55, 55);
            self.view1.center = CGPointMake(self.center.x+80,self.center.y-90);

            self.view1.alpha = 1;
            but.transform =  CGAffineTransformRotate(but.transform, M_PI/4);
        } completion:^(BOOL finished) {
        }];
    }
   
}
-(void)tapAction:(UITapGestureRecognizer *)tap{
    self.MoHu.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
        self.view1.center = self.view.center = self.center;
        self.view1.alpha = self.view.alpha = 0;
        self.XianShi = NO;
        _bnt.transform =  CGAffineTransformRotate(_bnt.transform, -M_PI/4);
    }];
    
}
//黄历界面
-(void)HuangLi:(UIButton*)sender
{
    HuangLi* hl = [HuangLi new];
  UINavigationController* navi = [[UINavigationController alloc]initWithRootViewController:hl];
    UIViewController* tbc =[UIApplication sharedApplication].keyWindow.rootViewController;
    [tbc presentViewController:navi animated:YES completion:nil];
}
//周公解梦
-(void)ZhouGongJieMeng:(UIButton*)sender
{
    ZhouGongJieMeng* zgjm = [ZhouGongJieMeng new];
    UINavigationController* navi = [[UINavigationController alloc]initWithRootViewController:zgjm];
    UIViewController* tbc =[UIApplication sharedApplication].keyWindow.rootViewController;
    [tbc presentViewController:navi animated:YES completion:nil];
}

//子控件布局方法  此方法 每次显示之前会调用
-(void)layoutSubviews{
    [super layoutSubviews];
    
//    NSLog(@"%@",self.subviews);
    UIView *fView = self.subviews[3];
    UIView *uView = self.subviews[4];
//    fView.center = CGPointMake(self.view.bounds.size.width/375*115, fView.center.y);
//    uView.center = CGPointMake(self.view.bounds.size.width/375*260, uView.center.y);
    fView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/375*115, fView.center.y);
    uView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/375*260, uView.center.y);
    
}



@end
