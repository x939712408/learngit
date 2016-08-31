//
//  DengLuJieMian.m
//  十二星座
//
//  Created by tarena on 16/6/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DengLuJieMian.h"

@interface DengLuJieMian ()
@property (weak, nonatomic) IBOutlet UIButton *DengLuButton;
@property (weak, nonatomic) IBOutlet UIButton *ZhuCeButton;
@property (weak, nonatomic) IBOutlet UITextField *ZhangHao;
@property (weak, nonatomic) IBOutlet UITextField *MiMa;
@property (weak, nonatomic) IBOutlet UIButton *WangJiMiMa;
@property (weak, nonatomic) IBOutlet UIButton *YouKe;

@end

@implementation DengLuJieMian

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.DengLuButton setRoundRectWithRadius:20 borderWidth:0 andColor:nil];
     [self.WangJiMiMa setRoundRectWithRadius:5 borderWidth:0 andColor:nil];
     [self.YouKe setRoundRectWithRadius:5 borderWidth:0 andColor:nil];
    [self.ZhuCeButton setRoundRectWithRadius:20 borderWidth:2 andColor:[UIColor whiteColor]];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.DengLuButton setTitle:@"登       录" forState:0];
}
- (IBAction)DengLu:(UIButton *)sender
{
    [self.view endEditing:YES];
    [BmobUser loginInbackgroundWithAccount:self.ZhangHao.text andPassword:self.MiMa.text block:^(BmobUser *user, NSError *error) {
        if (user) {
            UIViewController *XuanXinZuoVc = [self.storyboard instantiateViewControllerWithIdentifier:@"xuanxinzuo"];
            [self presentViewController:XuanXinZuoVc animated:YES completion:nil];
            NSLog(@"登录成功");
        } else {
            [sender setTitle:@"账号或密码错误" forState:0];
        }
    }];
}
- (IBAction)ShuRu:(UITextField *)sender {
    [self.DengLuButton setTitle:@"登       录" forState:0];
}

@end
