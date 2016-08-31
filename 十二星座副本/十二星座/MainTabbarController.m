//
//  MainTabbarController.m
//  达内微博
//
//  Created by tarena on 16/6/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MainTabbarController.h"
#import "RiJiBen.h"
#import "XinZuoYunShiXuanZhe.h"
#import "XingZuoPiPei.h"
#import "XingZuoChaKan.h"
#import "MyNabigationController.h"
#import "MyTabbar.h"
@interface MainTabbarController ()

@end

@implementation MainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    XingZuoChaKan *xzck = [XingZuoChaKan new];
    
    XinZuoYunShiXuanZhe *xzysxz = [XinZuoYunShiXuanZhe new];
    XingZuoPiPei *xzpp = [XingZuoPiPei new];
    
    RiJiBen *rjb = [RiJiBen new];
    
    
    xzck.title = @"星座查询";
    xzysxz.title = @"星座运势";
    xzpp.title = @"星座匹配";
    rjb.title = @"日记本";
    
    NSArray *menuImageNames = @[@"xz1",@"xz2",@"xz3",@"xz4"];
    
    xzck.tabBarItem.image = [UIImage imageNamed:menuImageNames[0]];
    xzysxz.tabBarItem.image = [UIImage imageNamed:menuImageNames[1]];
    xzpp.tabBarItem.image = [UIImage imageNamed:menuImageNames[2]];
    rjb.tabBarItem.image = [UIImage imageNamed:menuImageNames[3]];
    
  //  UIButton* but = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    [self addChildViewController:[[MyNabigationController alloc]initWithRootViewController:xzck]];
    [self addChildViewController:[[MyNabigationController alloc]initWithRootViewController:xzysxz]];
    [self addChildViewController:[[MyNabigationController alloc]initWithRootViewController:xzpp]];
    [self addChildViewController:[[MyNabigationController alloc]initWithRootViewController:rjb]];
    
    
    
    

    
    
//    完全自己添加bar里面的各种按钮  把原来的bar 盖上
//    UIView *barView = [[UIView alloc]initWithFrame:self.tabBar.frame];
//    barView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:barView];
    
    
    MyTabbar *tabbar = [[MyTabbar alloc]initWithFrame:self.tabBar.frame];
//    KVC 可以通过键值的方式对对象属性的进行赋值 和 取值
    [self setValue:tabbar forKey:@"tabBar"];
    
    self.tabBar.tintColor = [UIColor orangeColor];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
