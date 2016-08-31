//
//  ShouShiSuo.m
//  十二星座
// masonry
//  Created by tarena on 16/6/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//
#import "ViewController.h"
#import "GestureViewController.h"
#import "GestureVerifyViewController.h"
#import "PCCircleViewConst.h"
#import "ChongZhiShouShiSuo.h"
#import "ShouShiSuo.h"

@interface ShouShiSuo ()<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *SheZhiSuo;
@property (weak, nonatomic) IBOutlet UIButton *XiuGaiSuo;
@property (weak, nonatomic) IBOutlet UIButton *ChongZhiSouShiSuo;
@property(nonatomic,assign) BOOL shoushi;

@end

@implementation ShouShiSuo

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"手势锁设置";
    [self.SheZhiSuo setRoundRectWithRadius:10 borderWidth:0 andColor:nil];
    [self.XiuGaiSuo setRoundRectWithRadius:10 borderWidth:0 andColor:nil];
    [self.SheZhiSuo setRoundRectWithRadius:10 borderWidth:0 andColor:nil];
    [self.ChongZhiSouShiSuo setRoundRectWithRadius:10 borderWidth:0 andColor:nil];
    UIBarButtonItem* fanhui = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"fanhui"] style:0 target:self action:@selector(FanHui)];
    self.navigationItem.leftBarButtonItem = fanhui;
}

- (IBAction)BtnClick:(UIButton *)sender {
    
    switch (sender.tag) {
        case 1:
        {
            //设置过手势无法进入
            NSLog(@"%@",[PCCircleViewConst getGestureWithKey:gestureFinalSaveKey]);
             if ([[PCCircleViewConst getGestureWithKey:gestureFinalSaveKey] length])
             {
                 UIAlertController* aler = [UIAlertController alertControllerWithTitle:@"提示" message:@"手势锁已经设置，请修改手势锁，或者重置手势锁" preferredStyle:1];
                 UIAlertAction* act = [UIAlertAction actionWithTitle:@"确定" style:1 handler:^(UIAlertAction * _Nonnull action) {
                 }];
                 [aler addAction:act];
                [self presentViewController:aler animated:YES completion:nil];
             }
               //没设置过手势进行设置
            else
            {
                GestureViewController *gestureVc = [[GestureViewController alloc] init];
                gestureVc.type = GestureViewControllerTypeSetting;
                [self.navigationController pushViewController:gestureVc animated:YES];
            }
        }
            break;
        case 2:
        {
            if ([[PCCircleViewConst getGestureWithKey:gestureFinalSaveKey] length])
        {
            GestureVerifyViewController *gestureVerifyVc = [[GestureVerifyViewController alloc] init];
            gestureVerifyVc.isToSetNewGesture = YES;
            [self.navigationController pushViewController:gestureVerifyVc animated:YES];
        }else
        {
            
            UIAlertController* aler = [UIAlertController alertControllerWithTitle:@"提示" message:@"暂未设置手势密码，是否前往设置" preferredStyle:1];
            UIAlertAction* act = [UIAlertAction actionWithTitle:@"设置" style:0 handler:^(UIAlertAction * _Nonnull action) {
                GestureViewController *gestureVc = [[GestureViewController alloc] init];
                gestureVc.type = GestureViewControllerTypeSetting;
                [self.navigationController pushViewController:gestureVc animated:YES];
            }];
            UIAlertAction* act1 = [UIAlertAction actionWithTitle:@"取消" style:0 handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [aler addAction:act];
            [aler addAction:act1];
            [self presentViewController:aler animated:YES completion:nil];
        }
        }
            break;
        case 3:
        {
            ChongZhiShouShiSuo* czsss = [[ChongZhiShouShiSuo alloc]init];
            [self.navigationController pushViewController:czsss animated:YES];
        }
        break;
        default:
            break;
    }
}

//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex == 1) {
//        GestureViewController *gestureVc = [[GestureViewController alloc] init];
//        gestureVc.type = GestureViewControllerTypeSetting;
//        [self.navigationController pushViewController:gestureVc animated:YES];
//    }
//}
//返回登录界面
-(void)FanHui
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
