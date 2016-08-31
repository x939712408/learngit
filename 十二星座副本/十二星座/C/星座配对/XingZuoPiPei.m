 //
//  XingZuoPiPei.m
//  十二星座
//
//  Created by tarena on 16/6/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XingZuoPiPei.h"
#import "LiuXingYu.h"
#import "UIButton+ButtonYangShi.h"
#import "PeiDuiWangZhi.h"
@interface XingZuoPiPei ()
@property (weak, nonatomic) IBOutlet UIImageView *BeiJingTuPian;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *XingZuoPeiDui;
@property (weak, nonatomic) IBOutlet UIImageView *ZhuanPanImageView;
@property (nonatomic, strong)NSMutableArray *pvs;
@property (weak, nonatomic) IBOutlet UIButton *ZuoButton;
@property (weak, nonatomic) IBOutlet UIButton *YouBUtton;
@property (weak, nonatomic) IBOutlet UIButton *XuanZhuan;
@property (nonatomic,assign) NSInteger i;
@property(nonatomic,strong) NSArray* xingzuoarr;
@property(nonatomic,strong)NSTimer *timer1;
@property(nonatomic,strong)NSTimer *timer2;
@property(nonatomic,assign,getter=_ZhuanPanduan)BOOL zhuanpanduan;
@end

@implementation XingZuoPiPei

-(NSArray*)xingzuoarr
{
    if (!_xingzuoarr)
    {
        _xingzuoarr = @[@"白羊座",@"金牛座",@"双子座",@"巨蟹座",@"狮子座",@"处女座",@"天秤座",@"天蝎座",@"射手座",@"摩羯座",@"水瓶座",@"双鱼座"];
    }
    return _xingzuoarr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    for (UIButton* button in self.XingZuoPeiDui) {
        //设置 圆角的宽度
        //设置 圆角的颜色
        [button setRoundRectWithRadius:[UIScreen mainScreen].bounds.size.width/375*30 borderWidth:3 andColor: [UIColor blackColor]];
    }
    self.XuanZhuan.layer.masksToBounds = YES;
    self.XuanZhuan.layer.cornerRadius = 10;
    self.ZhuanPanImageView.layer.cornerRadius =[UIScreen mainScreen].bounds.size.width/375*120;
    self.ZhuanPanImageView.layer.borderWidth = 3;
    self.ZhuanPanImageView.layer.borderColor = [UIColor blackColor].CGColor;
    //添加流星
    self.pvs = [NSMutableArray array];
    self.timer1=[NSTimer timerWithTimeInterval:0.5
                                       target:self
                                     selector:@selector(addliuxing)
                                     userInfo:nil
                                      repeats:YES];
    //移动流星
    self.timer2=[NSTimer timerWithTimeInterval:1.0/60
                                        target:self
                                      selector:@selector(moveAction)
                                      userInfo:nil
                                       repeats:YES];
    NSRunLoop *runloop=[NSRunLoop currentRunLoop];
    [runloop addTimer:self.timer1 forMode:NSDefaultRunLoopMode];
     [runloop addTimer:self.timer2 forMode:NSDefaultRunLoopMode];
    
    self.i = 48;
    self.zhuanpanduan = NO;

}
//向左转动星座
- (IBAction)RightButton:(UIButton *)sender
{
    
    NSInteger i = 0;
     NSInteger x = ((UIButton*)self.XingZuoPeiDui[0]).tag;
    //星座转换动画
    CGRect rect =((UIButton*)self.XingZuoPeiDui [i]).frame;
    for (; i<self.XingZuoPeiDui.count-1; i++) {
        [UIView animateWithDuration:1 animations:^{
            ((UIButton*)self.XingZuoPeiDui[i]).frame= ((UIButton*)self.XingZuoPeiDui [i+1]).frame;
             ((UIButton*)self.XingZuoPeiDui[i]).tag = ((UIButton*)self.XingZuoPeiDui [i+1]).tag;
        }];
    }
    [UIView animateWithDuration:1 animations:^{
        ((UIButton*)self.XingZuoPeiDui[i]).frame= rect;
        ((UIButton*)self.XingZuoPeiDui[i]).tag = x;
    }];

}
//向右转动星座
- (IBAction)LfitButton:(UIButton *)sender
{
    NSInteger i=self.XingZuoPeiDui.count-1;
    NSInteger x = ((UIButton*)self.XingZuoPeiDui[11]).tag;
    //星座转换动画
    CGRect rect =((UIButton*)self.XingZuoPeiDui [i]).frame;
    for (; i>0; i--) {
        [UIView animateWithDuration:1 animations:^{
            ((UIButton*)self.XingZuoPeiDui[i]).frame= ((UIButton*)self.XingZuoPeiDui [i-1]).frame;
             ((UIButton*)self.XingZuoPeiDui[i]).tag = ((UIButton*)self.XingZuoPeiDui [i-1]).tag;
        }];
    }
    [UIView animateWithDuration:1 animations:^{
        ((UIButton*)self.XingZuoPeiDui[i]).frame= rect;
        ((UIButton*)self.XingZuoPeiDui[i]).tag = x;
    }];
}
//旋转中心转盘
- (IBAction)SuiJiZhuanDong:(UIButton *)sender
{
    for (UIButton* bnt in self.XingZuoPeiDui) {
        bnt.enabled = NO;
    }
    self.zhuanpanduan = YES;
    sender.enabled = NO;
    self.ZhuanPanImageView.transform = CGAffineTransformIdentity;
    self.i  = arc4random()%13+48;
    [UIView animateWithDuration:2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         for (int i ; i < self.i; i++) {
                                self.ZhuanPanImageView.transform =  CGAffineTransformRotate(self.ZhuanPanImageView.transform, M_PI/6);
                         }
                     }
                     completion:^(BOOL finished) {
                         for (UIButton* bnt in self.XingZuoPeiDui) {
                             bnt.enabled = YES;
                         }
                         sender.enabled = YES;
                      }];
}

//增加流星
-(void)addliuxing{
    LiuXingYu *lx = [[LiuXingYu alloc]initWithI:arc4random()%20+1];
    //设置显示图片
    [self.BeiJingTuPian addSubview:lx];
    [self.pvs addObject:lx];
}
//流星飞舞
-(void)moveAction
{
//    NSLog(@"%lu",self.pvs.count);
    for (LiuXingYu *lx in self.pvs) {

            lx.center = CGPointMake(lx.center.x+lx.speed, lx.center.y-lx.speed);
            [UIView animateWithDuration:2 animations:^{
                          lx.alpha = 0;
                }];
        if (lx.center.x>self.view.frame.size.width+lx.bounds.size.width/2 )
        {
            [lx removeFromSuperview];
            [self.pvs removeObject:lx];
            break;
        }
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:[NSNumber numberWithBool:YES] forKey:@"panduan"];
    self.tabBarController.tabBar.hidden = NO;
    //开启流星
    [self.timer1 setFireDate:[NSDate date]];
    [self.timer2 setFireDate:[NSDate date]];

}
- (IBAction)KaiShiPiPei:(UIButton *)sender {
    if (self._ZhuanPanduan) {
        self.xingzuoarr = @[@"白羊座",@"金牛座",@"双子座",@"巨蟹座",@"狮子座",@"处女座",@"天秤座",@"天蝎座",@"射手座",@"摩羯座",@"水瓶座",@"双鱼座"];
    }
    NSString* but = sender.titleLabel.text;
    NSString* zhuanpan = nil;
    if (sender.tag - ((self.i*30-360*4)/30+1) >= 0) {
         NSInteger x = sender.tag - ((self.i*30-360*4)/30+1);
        zhuanpan = self.xingzuoarr[x];
    }
    else
    {
         NSInteger x = sender.tag - ((self.i*30-360*4)/30+1);
        x = 12 + x;
        zhuanpan = self.xingzuoarr[x];
    }
    PeiDuiWangZhi* wangzi = [[PeiDuiWangZhi alloc]init];
    wangzi.bntxingzuo = but;
    wangzi.zhuanpanxingzuo = zhuanpan;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController:wangzi animated:YES];
}


//关闭流行
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
     [self.timer1 setFireDate:[NSDate distantFuture]];
     [self.timer2 setFireDate:[NSDate distantFuture]];
}

@end
