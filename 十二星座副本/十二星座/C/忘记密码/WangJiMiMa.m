//
//  WangJiMiMa.m
//  十二星座
//
//  Created by tarena on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "WangJiMiMa.h"

@interface WangJiMiMa ()
@property (weak, nonatomic) IBOutlet UITextField *XinMiMa;
@property (weak, nonatomic) IBOutlet UITextField *ShouJiHaoMa;
@property (weak, nonatomic) IBOutlet UIButton *WanCheng;
@property (weak, nonatomic) IBOutlet UIButton *YanZhengMaButton;
@property (weak, nonatomic) IBOutlet UITextField *YanZhengMa;
@property (weak, nonatomic) IBOutlet UIView *MiMaChangDu;
@property (weak, nonatomic) IBOutlet UIView *HaoMaChangDu;

@end

@implementation WangJiMiMa

- (void)viewDidLoad {
    [super viewDidLoad];
     [self.WanCheng setRoundRectWithRadius:20 borderWidth:0 andColor:nil];
      [self.YanZhengMaButton setRoundRectWithRadius:5 borderWidth:0 andColor:nil];
    UIBarButtonItem* fanhui = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"fanhui"] style:0 target:self action:@selector(FanHui)];
    self.navigationItem.leftBarButtonItem = fanhui;
}
- (IBAction)WanCheng:(UIButton *)sender
{
     [self.view endEditing:YES];
    [sender setTitle:@"正在验证" forState:0];

    [BmobUser resetPasswordInbackgroundWithSMSCode:self.YanZhengMa.text andNewPassword:self.XinMiMa.text block:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            NSLog(@"%@",@"重置密码成功");
            [self dismissViewControllerAnimated:YES completion:nil];
            
        } else {
            NSLog(@"%@",error);
            [sender setTitle:@"输入错误" forState:0];
        }
    }];
 
}
//输入新密码
- (IBAction)XinMiMaShuRu:(UITextField *)sender
{
    if ( sender.text.length>= 8 && sender.text.length < 17) {
        self.MiMaChangDu.hidden = YES;
    }else
    {
        self.MiMaChangDu.hidden = NO;
    }
    if ( sender.text.length == 0) {
        self.MiMaChangDu.hidden = YES;
        
    }
}

//开始输入个选项
- (IBAction)KaiShiShuRu:(id)sender
{
    [self.WanCheng setTitle:@"登           录" forState:0];
}
//关闭输入法
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)YanZhengMa:(UIButton *)sender
{
    sender.enabled = NO;
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(DaoJiShi:) userInfo:nil repeats:YES];
    [BmobSMS requestSMSCodeInBackgroundWithPhoneNumber:self.ShouJiHaoMa.text andTemplate:@"星族" resultBlock:^(int number, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        } else {
            //获得smsID
            NSLog(@"sms ID：%d",number);
        }
    }];
    
}
//判断手机号码长度
- (IBAction)ShouJIHaoMaYanZheng:(UITextField *)sender
{

    if ( sender.text.length == 0) {

        self.HaoMaChangDu.hidden = YES;
    }
    if(sender.text.length != 11 && sender.text.length>0)
    {
        self.HaoMaChangDu.hidden = NO;
    }

    if(sender.text.length == 11)
    {
         self.HaoMaChangDu.hidden = YES;
        self.YanZhengMaButton.enabled = YES;
    }else
    {
        self.YanZhengMaButton.enabled = NO;
    }
}

//短信验证倒计时
-(void)DaoJiShi:(NSTimer*)timer
{
    static int i = 60;
    i--;
    NSString* str = [NSString stringWithFormat:@"%d 短信倒计时",i];
    [self.YanZhengMaButton setTitle:str forState:0];
    if (i == 0) {
        [self.YanZhengMaButton setTitle:@"获取短信验证" forState:0];
        self.YanZhengMaButton.enabled = YES;
        i = 60;
        [timer invalidate];
    }
    
}

//返回登录界面
-(void)FanHui
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
