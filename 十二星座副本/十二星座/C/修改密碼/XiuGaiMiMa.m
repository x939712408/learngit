//
//  XiuGaiMiMa.m
//  十二星座
//
//  Created by tarena on 16/6/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XiuGaiMiMa.h"

@interface XiuGaiMiMa ()
@property (weak, nonatomic) IBOutlet UIView *XinMiMaTiShi;
@property (weak, nonatomic) IBOutlet UIView *JiuMiMaTiShi;
@property (weak, nonatomic) IBOutlet UITextField *JiuMiMa;
@property (weak, nonatomic) IBOutlet UITextField *XinMiMa;
@property (weak, nonatomic) IBOutlet UIButton *WanCheng;

@end

@implementation XiuGaiMiMa

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.WanCheng setRoundRectWithRadius:20 borderWidth:0 andColor:nil];
    UIBarButtonItem* fanhui = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"fanhui"] style:0 target:self action:@selector(FanHui)];
    self.navigationItem.leftBarButtonItem = fanhui;
    self.navigationItem.title = @"修改密码";
    // Do any additional setup after loading the view from its nib.
}
//旧密码长度判断
- (IBAction)JiuMiMAChangDuPAanDuan:(UITextField *)sender
{
    if ( sender.text.length>= 8 && sender.text.length < 17) {
        self.JiuMiMaTiShi.hidden = YES;
    }else
    {
        self.JiuMiMaTiShi.hidden = NO;
    }
    if ( sender.text.length == 0) {
        self.JiuMiMaTiShi.hidden = YES;
        
    }
}
//新密码长度判断
- (IBAction)XinMiMAChangDuPAanDuan:(UITextField *)sender
{
    if ( sender.text.length>= 8 && sender.text.length < 17) {
        self.XinMiMaTiShi.hidden = YES;
    }else
    {
        self.XinMiMaTiShi.hidden = NO;
    }
    if ( sender.text.length == 0) {
        self.XinMiMaTiShi.hidden = YES;
        
    }
}
- (IBAction)WanCheng:(UIButton *)sender
{
    [sender setTitle:@"正在修改中..." forState:0];
    BmobUser *user = [BmobUser getCurrentUser];
    [self.view endEditing:YES];
    [user updateCurrentUserPasswordWithOldPassword:self.JiuMiMa.text newPassword:self.XinMiMa.text block:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful)
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            [sender setTitle:@"设置密码错误" forState:0];
        }
    }];
}
//开始输入个选项
- (IBAction)KaiShiShuRu:(id)sender
{
    [self.WanCheng setTitle:@"完         成" forState:0];
}
//收键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
//返回登录界面
-(void)FanHui
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
