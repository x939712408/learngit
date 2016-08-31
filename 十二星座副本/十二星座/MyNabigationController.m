//
//  MyNabigationController.m
//  Demo3_故事板_新闻
//
//  Created by tarena on 16/5/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MyNabigationController.h"
#import "UIButton+ButtonYangShi.h"
#import "XMGMainViewController.h"
#import "AppDelegate.h"
@interface MyNabigationController ()<UIGestureRecognizerDelegate>

@end

@implementation MyNabigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    // 获取系统自带滑动手势的target对象
    id target = self.interactivePopGestureRecognizer.delegate;
    
    // 创建全屏滑动手势，调用系统自带滑动手势的target的action方法
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    
    // 设置手势代理，拦截手势触发
    pan.delegate = self;
    
    // 给导航控制器的view添加全屏滑动手势
    [self.view addGestureRecognizer:pan];
    
    // 禁止使用系统自带的滑动手势
    self.interactivePopGestureRecognizer.enabled = NO;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:YES] forKey:@"panduan"];
    [defaults synchronize];

}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 注意：只有非根控制器才有滑动返回功能，根控制器没有。
    // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
    if (self.childViewControllers.count == 1) {
        // 表示用户在根控制器界面，就不需要触发滑动手势，
        return NO;
    }
    return YES;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"panduan"] boolValue]) {
        NSString *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/touxiang.jpg"];
        //把文件数据加载进来
        NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
        //解析图片
        self.touxiang = [NSKeyedUnarchiver unarchiveObjectWithData:imageData];
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 35, 35);
        //设置按钮为圆形样式
        [button setRoundRectWithRadius:button.frame.size.width/2 borderWidth:2 andColor: [UIColor whiteColor]];
        [button setBackgroundImage:self.touxiang forState:UIControlStateNormal];
        [button addTarget:self action:@selector(YiDong:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem* bar = [[UIBarButtonItem alloc]initWithCustomView:button];
        self.topViewController.navigationItem.leftBarButtonItem = bar;
    }
}


-(void)YiDong:(UIButton*)sender
{
    
   XMGMainViewController* xmg = [XMGMainViewController sharePlayingXMG];
        xmg.but =sender;
        [xmg YiDongJieMian];
        sender.hidden = YES;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//      self.navigationBar.barStyle=UIBarStyleBlackTranslucent;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
