//
//  ChongZhiShouShiSuo.m
//  十二星座
//
//  Created by tarena on 16/6/29.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ChongZhiShouShiSuo.h"

@interface ChongZhiShouShiSuo ()
@property (weak, nonatomic) IBOutlet UITextField *ShuRuMiMa;
@property (weak, nonatomic) IBOutlet UIButton *ZhongZhiButton;

@end

@implementation ChongZhiShouShiSuo

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.ZhongZhiButton setRoundRectWithRadius:20 borderWidth:0 andColor:nil];
    self.navigationItem.title = @"重置手势锁";
}
- (IBAction)ShouShiChongZhi:(UIButton *)sender
{
    [self.view endEditing:YES];
   BmobUser *bUser = [BmobUser getCurrentUser];
    NSString* str = [bUser objectForKey:@"email"];
    NSLog(@"%@",str);
    if ([str isEqualToString:self.ShuRuMiMa.text]) {
        //手势锁重置
        [PCCircleViewConst saveGesture:nil Key:gestureFinalSaveKey];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [sender setTitle:@"密码错误" forState:0];
    }
}
- (IBAction)HuiFuButton:(UITextField *)sender {
    [self.ZhongZhiButton setTitle:@"重        置" forState:0];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
