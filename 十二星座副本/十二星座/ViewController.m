//
//  ViewController.m
//  十二星座
//
//  Created by tarena on 16/6/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//
#import "RiJiBen.h"
#import "ViewController.h"
#import "XingZuoChaKan.h"
#import "XingZuoPiPei.h"
#import "XingZuoUtils.h"
#import "XinZuoYunShiXuanZhe.h"
#import "MainTabbarController.h"
#import "MyNabigationController.h"
#import "XMGMainViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *BiaoTi;
/*星座日期的LabLe*/
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *YeMianXingZuoRiQi;
/*星座名*/
@property(nonatomic,strong)NSArray* Xingzuoming;
@property (weak, nonatomic) IBOutlet UIView *OneView;
@property (weak, nonatomic) IBOutlet UIView *TwoView;
@property (weak, nonatomic) IBOutlet UIView *ThreeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取星座名plist文件数据赋值
    NSString* plist = [[NSBundle mainBundle]pathForResource:@"xingzuoming" ofType:@"plist"];
    self.Xingzuoming = [NSArray arrayWithContentsOfFile:plist];
    //设置选择星座界面每个星座日期的字体
    UIFont* font = [UIFont fontWithName:@"DBLCDTempBlack" size:15];
    for (UILabel* label in self.YeMianXingZuoRiQi) {
        label.font = font;
    }
    //设置 @"请选择自己的星座"动画效果
    font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:25];
    self.BiaoTi.font = font;
    CGRect endFrame=self.BiaoTi.frame;
    CGRect startFrame=endFrame;
    startFrame.origin.x=-startFrame.size.width;
    self.BiaoTi.frame=startFrame;
    self.BiaoTi.alpha=0.1;
    __weak ViewController* weakself = self;
    [UIView animateWithDuration:2.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        weakself.BiaoTi.frame=endFrame;
        weakself.BiaoTi.alpha=1.0;
    } completion:^(BOOL finished) {
        //        self.enterBtn.alpha=1;
    }];
    CGRect Frame1 = self.OneView.frame;
    CGRect Frame3 = self.ThreeView.frame;
    self.OneView.frame = CGRectMake([UIScreen mainScreen].bounds.origin.x-self.OneView.bounds.size.width, self.OneView.frame.origin.y,self.OneView.bounds.size.width,self.OneView.bounds.size.height);
    self.ThreeView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width+self.ThreeView.bounds.size.width, self.ThreeView.frame.origin.y,self.ThreeView.bounds.size.width,self.ThreeView.bounds.size.height);
    [UIView animateWithDuration:2 animations:^{
        weakself.OneView.frame = Frame1;
        weakself.ThreeView.frame =Frame3;
        weakself.TwoView.alpha   = 1;
    }];

}

//设置选着星座按钮
- (IBAction)XingZuoButton:(UIButton *)sender
{
    XMGMainViewController* xmg = [XMGMainViewController sharePlayingXMG];
    NSString *newImagePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/touxiang.jpg"];
    //解析图片
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:sender.currentBackgroundImage];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithInteger:sender.tag] forKey:@"gerenshezhibeijing"];
    //保存到路径
    [data writeToFile:newImagePath atomically:YES];
    getUser.noBegin = YES;
    [getUser saveBegin];
    self.view.window.rootViewController = xmg;
    

}

-(void)dealloc
{
    NSLog(@"选择星座界面被释放");
}
@end
