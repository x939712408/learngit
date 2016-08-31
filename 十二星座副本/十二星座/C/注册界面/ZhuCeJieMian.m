//
//  ZhuCeJieMian.m
//  十二星座
//
//  Created by tarena on 16/6/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZhuCeJieMian.h"

@interface ZhuCeJieMian ()
@property (weak, nonatomic) IBOutlet UITextField *YongHuMingZC;
@property (weak, nonatomic) IBOutlet UITextField *MiMaCZ;
@property (weak, nonatomic) IBOutlet UITextField *YouXiang;
@property (nonatomic,strong)BmobUser *ShangChuanSuJu;
@property (weak, nonatomic) IBOutlet UIButton *WanCheng;
@property (weak, nonatomic) IBOutlet UIView *ZhangHaoChangDu;
@property (weak, nonatomic) IBOutlet UIView *ZhangHaoZiMu;
@property (weak, nonatomic) IBOutlet UIView *ZhangHaoCunZai;
@property (weak, nonatomic) IBOutlet UIView *MiMaChangDu;
@property (weak, nonatomic) IBOutlet UIView *YouXiangGeShi;
@property (weak, nonatomic) IBOutlet UIView *YouXiangShiFouZhuCe;
@property (weak, nonatomic) IBOutlet UITextField *ShouJiHaoMa;
@property (weak, nonatomic) IBOutlet UITextField *YanZhengMa;
@property (weak, nonatomic) IBOutlet UIButton *YanZhengMaButton;
@property (weak, nonatomic) IBOutlet UIView *ShouJIHaoMaYanZheng;
@property (weak, nonatomic) IBOutlet UIView *HaoMaChangDu;
@end

@implementation ZhuCeJieMian

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.WanCheng setRoundRectWithRadius:20 borderWidth:0 andColor:nil];
    [self.YanZhengMaButton setRoundRectWithRadius:5 borderWidth:0 andColor:nil];
    self.ShangChuanSuJu = [BmobUser new];
    UIBarButtonItem* fanhui = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"fanhui"] style:0 target:self action:@selector(FanHui)];
    self.navigationItem.leftBarButtonItem = fanhui;
}

- (IBAction)WanChengZC:(UIButton *)sender
{
    [self.view endEditing:YES];
    if (self.ZhangHaoChangDu.hidden == NO) {
        [sender setTitle:@"账号长度输入错误" forState:0];
        return;
    }else if (self.MiMaChangDu.hidden == NO) {
        [sender setTitle:@"密码长度输入错误" forState:0];
        return;
    }else if (self.ZhangHaoCunZai.hidden == NO)
    {
        [sender setTitle:@"账号已存在" forState:0];
        return;
    }
    else if (self.YouXiangGeShi.hidden == NO)
    {
        [sender setTitle:@"邮箱格式输入错误" forState:0];
        return;
    }else if (self.YouXiangShiFouZhuCe.hidden == NO)
    {
        [sender setTitle:@"邮箱已存在" forState:0];
        return;
    }else if (self.ShouJIHaoMaYanZheng.hidden == NO)
    {
        [sender setTitle:@"手机号码已注册" forState:0];
        return;
    }
    [sender setTitle:@"注册中...." forState:0];
    self.ShangChuanSuJu.username = self.YongHuMingZC.text;
    self.ShangChuanSuJu.password = self.MiMaCZ.text;
    self.ShangChuanSuJu.email = self.YouXiang.text;
    self.ShangChuanSuJu.mobilePhoneNumber = self.ShouJiHaoMa.text;
    [self.ShangChuanSuJu signUpOrLoginInbackgroundWithSMSCode:self.YanZhengMa.text block:^(BOOL isSuccessful, NSError *error) {
        
        if (error) {
            NSLog(@"%@",error);
            [sender setTitle:@"输入有误" forState:0];
        }else{
            UIViewController *XuanXinZuoVc = [self.storyboard instantiateViewControllerWithIdentifier:@"xuanxinzuo"];
            [self presentViewController:XuanXinZuoVc animated:YES completion:nil];
            NSLog(@"注册成功");
        }
  }];
}
//返回登录界面
-(void)FanHui
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//输入完账号后进行判断
- (IBAction)ZhaoHaoJianCe:(UITextField *)sender
{
    if ( sender.text.length>= 8 && sender.text.length < 17)
    {
        self.ZhangHaoChangDu.hidden = YES;
    }
    else
    {
        self.ZhangHaoChangDu.hidden = NO;
    }
    
    //判断账号是否存在
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"_User"];
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array)
        {
            if ([sender.text isEqualToString:[obj objectForKey:@"username"]])
            {
                self.ZhangHaoCunZai.hidden = NO;
                break;
            }
            else
            {
                self.ZhangHaoCunZai.hidden= YES;
            }
        }
    }];
    if ( sender.text.length == 0) {
         self.ZhangHaoCunZai.hidden= YES;
        self.ZhangHaoChangDu.hidden = YES;
    }
    
}
//密码长度判断
- (IBAction)MiMAChangDuPAanDuan:(UITextField *)sender
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
//判断邮箱格式
- (IBAction)YouXiangGeShi:(UITextField *)sender
{
    NSArray* array = [sender.text componentsSeparatedByString:@"@"];
    NSRange range = [sender.text rangeOfString:@"@."];
    if (array.count == 2 && [sender.text hasSuffix:@".com"]&& ![sender.text hasSuffix:@"@.com"] && range.location == NSNotFound && ![sender.text hasSuffix:@"..com"]) {
        self.YouXiangGeShi.hidden = YES;
    }else
    {
        self.YouXiangGeShi.hidden = NO;
    }
    //判断邮箱是否存在
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"_User"];
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array)
        {
            if ([sender.text isEqualToString:[obj objectForKey:@"email"]])
            {
                self.YouXiangShiFouZhuCe.hidden = NO;
                break;
            }
            else
            {
                self.YouXiangShiFouZhuCe.hidden= YES;
            }
        }
    }];
    if ( sender.text.length == 0) {
        self.YouXiangShiFouZhuCe.hidden = YES;
        self.YouXiangGeShi.hidden = YES;
    }
    
}
//判断手机号码是否存在
- (IBAction)ShouJIHaoMaYanZheng:(UITextField *)sender
{
    //判断手机号码是否存在
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"_User"];
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array)
        {
            if ([sender.text isEqualToString:[obj objectForKey:@"mobilePhoneNumber"]]&& sender.text.length != 0)
            {
                self.ShouJIHaoMaYanZheng.hidden = NO;
                break;
            }
            else
            {
                self.ShouJIHaoMaYanZheng.hidden= YES;
                
            }
        }
    }];
  
    if(sender.text.length != 11)
    {
        self.HaoMaChangDu.hidden = NO;
    }else
    {
        self.HaoMaChangDu.hidden = YES; 
    }
    if(sender.text.length == 11 && self.ShouJIHaoMaYanZheng.isHidden == YES)
    {
        self.YanZhengMaButton.enabled = YES;
    }
    if ( sender.text.length == 0) {
        self.ShouJIHaoMaYanZheng.hidden = YES;
        self.HaoMaChangDu.hidden = YES;
    }
}

//获取验证码
- (IBAction)HuoQuYanZhengma:(UIButton *)sender {
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
//开始输入个选项
- (IBAction)KaiShiShuRu:(id)sender
{
    [self.WanCheng setTitle:@"完        成" forState:0];
}

//关闭输入法
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
