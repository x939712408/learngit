//
//  ZhouGongJieMeng.m
//  十二星座
//
//  Created by tarena on 16/6/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZhouGongJieMeng.h"
#import "ZhouGongJieMengM.h"
#import "XingZuoUtils.h"
@interface ZhouGongJieMeng ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *SouSuoMeng;
@property (weak, nonatomic) IBOutlet UIImageView *TuBiao;
@property (weak, nonatomic) IBOutlet UITableView *SouSuoNeiRong;
@property(nonatomic,strong) NSMutableArray* MengS;
@property (weak, nonatomic) IBOutlet UILabel *BiaoTi;
@property (weak, nonatomic) IBOutlet UILabel *JIeShuoMeng;
@property (weak, nonatomic) IBOutlet UIView *JieShuoBan;

@end

@implementation ZhouGongJieMeng

- (void)viewDidLoad {
    [super viewDidLoad];
    self.SouSuoNeiRong.backgroundColor = [UIColor clearColor];
    self.SouSuoNeiRong.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.TuBiao.layer.masksToBounds = YES;
    self.TuBiao.layer.cornerRadius = 11;
    self.TuBiao.layer.borderWidth = 2;
    self.TuBiao.layer.borderColor = [UIColor whiteColor].CGColor;
    self.navigationItem.title = @"周公解梦";
    UIBarButtonItem* fanhui = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"fanhui"] style:0 target:self action:@selector(FanHui)];
    self.navigationItem.leftBarButtonItem = fanhui;

}
- (IBAction)SouSuoButtom:(UIButton *)sender
{
    self.JieShuoBan.hidden = YES;
    self.SouSuoNeiRong.alpha = 0;
    [XingZuoUtils requestTokenWithZhongLei:self.SouSuoMeng.text Callback:^(id obj) {
        if(obj == nil)
        {
            self.SouSuoMeng.textColor = [UIColor redColor];
            [self.SouSuoMeng.layer addAnimation:[self shake] forKey:nil];
        }
        self.MengS = obj;
        [self.SouSuoNeiRong reloadData];
        [UIView animateWithDuration:0.8 animations:^{
              self.SouSuoNeiRong.alpha = 1;
        }];
    }];
    [self.view endEditing:YES];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.MengS.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.textAlignment = 1;
    cell.backgroundColor = [UIColor clearColor];
    ZhouGongJieMengM* zgjm = self.MengS[indexPath.row];
    cell.textLabel.text = zgjm.title;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 24;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     ZhouGongJieMengM* zgjm = self.MengS[indexPath.row];
    self.BiaoTi.text = zgjm.title;
    self.JIeShuoMeng.text = zgjm.des;
    [self JiSuanWenBEN];
     self.SouSuoNeiRong.alpha = 0;
    self.JieShuoBan.hidden = NO;
}
- (IBAction)YingCang:(UITapGestureRecognizer *)sender {
    self.SouSuoNeiRong.alpha = 1;
    self.JieShuoBan.hidden = YES;
}
- (IBAction)KaiShiBianJi:(UITextField *)sender {
     self.JieShuoBan.hidden = YES;
    self.SouSuoMeng.textColor = [UIColor blackColor];

}
//隐藏键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
      [self.view endEditing:YES];
}
-(float)getTextHeight:(NSString*)text{
    
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:17]};
    
    
    //计算文本高度
    CGSize retSize = [text boundingRectWithSize:CGSizeMake(self.JIeShuoMeng.frame.size.width-10, CGFLOAT_MAX)
                                        options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    
    return retSize.height;
    
}
-(void)JiSuanWenBEN
{
    self.JIeShuoMeng.frame = CGRectMake(self.JIeShuoMeng.frame.origin.x,self.JIeShuoMeng.frame.origin.y,self.JIeShuoMeng.frame.size.width,[self getTextHeight:self.JIeShuoMeng.text]);
}
//返回
-(void)FanHui
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//设置用户名输入错误时的震动效果
-(CAKeyframeAnimation *)shake{
    
    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    
    CGFloat s = 5;
    
    kfa.values = @[@(-s),@(0),@(s),@(0),@(-s),@(0),@(s),@(0)];
    
    //时长
    kfa.duration = 0.3f;
    
    //重复
    kfa.repeatCount = 2;
    
    //移除
    kfa.removedOnCompletion = YES;
    
    return kfa;
}
@end
