//
//  HuangLi.m
//  十二星座
//
//  Created by tarena on 16/6/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HuangLi.h"
#import "HuangLIM.h"
#import "XingZuoUtils.h"
@interface HuangLi ()
@property (weak, nonatomic) IBOutlet UIView *HuangLITuCengView;
@property (weak, nonatomic) IBOutlet UILabel *YinLi;
@property (weak, nonatomic) IBOutlet UILabel *ChongSha;
@property (weak, nonatomic) IBOutlet UILabel *BaiJi;
@property (weak, nonatomic) IBOutlet UILabel *WuXing;
@property (weak, nonatomic) IBOutlet UILabel *JiShen;
@property (weak, nonatomic) IBOutlet UILabel *XiongShen;
@property (weak, nonatomic) IBOutlet UILabel *Yi;
@property (weak, nonatomic) IBOutlet UILabel *Ji;
@property (weak, nonatomic) IBOutlet UIDatePicker *ShiJianZhou;
@property (weak, nonatomic) IBOutlet UILabel *yizi;
@property (weak, nonatomic) IBOutlet UILabel *jizi;
@property(nonatomic,strong) UIButton* but;
@property (weak, nonatomic) IBOutlet UIView *shijianbeijing;
@property (weak, nonatomic) IBOutlet UIImageView *jingxiang;

@end

@implementation HuangLi

- (void)viewDidLoad {
    [super viewDidLoad];

    self.yizi.layer.masksToBounds =
    self.jizi.layer.masksToBounds = YES;
    self.yizi.layer.cornerRadius = self.jizi.layer.cornerRadius = self.yizi.bounds.size.width/2;
    self.yizi.layer.borderWidth = self.jizi.layer.borderWidth = 2;
    self.yizi.layer.borderColor = [UIColor blueColor].CGColor;
    self.jizi.layer.borderColor = [UIColor redColor].CGColor;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    //2.指定时间的转换格式
    //HH表示24小时制，hh表示12小时制
    formatter.dateFormat = @"yyyy-MM-dd";
    //日期转字符串
    NSString *dateString = [formatter stringFromDate:[NSDate date]];
    [self JieMianFuZhi:dateString];
    UIButton* but =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 120, 20)];
    [but setTitle:dateString forState:0];
    [but setTitleColor:[UIColor whiteColor] forState:0];
    UIImageView* image = [[UIImageView alloc]initWithFrame:CGRectMake(but.bounds.size.width, 0, 20,20)];
//    image.backgroundColor = [UIColor redColor];
    image.image = [UIImage imageNamed:@"shangxiajiantou"];
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 140, 20)];
    self.but = but;
    [but addTarget:self action:@selector(huanShiJian:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:but];
    [view addSubview:image];
    self.navigationItem.titleView = view;
    self.jingxiang.transform = CGAffineTransformMakeScale(1, -1);
      UIBarButtonItem* fanhui = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"fanhui"] style:0 target:self action:@selector(HuiJia)];
    self.navigationItem.leftBarButtonItem = fanhui;
}

-(void)JieMianFuZhi:(NSString*)shijian
{
    
    [XingZuoUtils requestTokenWithRiQi:shijian andCallback:^(id obj) {
        HuangLIM* hl = obj;
        self.YinLi.text = hl.yinli;
        self.ChongSha.text = hl.chongsha;
        self.BaiJi.text = hl.baiji;
        self.WuXing.text = hl.wuxing;
        self.JiShen.text = hl.jishen;
        self.XiongShen.text = hl.xiongshen;
        self.Yi.text = hl.yi;
        self.Ji.text = hl.ji;
    }];
    
}
- (IBAction)ShiJianZhou:(UIDatePicker *)sender
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    //2.指定时间的转换格式
    //HH表示24小时制，hh表示12小时制
    formatter.dateFormat = @"yyyy-MM-dd";
    //日期转字符串
    NSString *dateString = [formatter stringFromDate:self.ShiJianZhou.date];
    [self.but setTitle:dateString forState:0];
    [self JieMianFuZhi:dateString];

}

-(void)huanShiJian:(UIButton*)sender
{
    if (self.shijianbeijing.frame.origin.y == [UIScreen mainScreen].bounds.size.height) {
        [UIView animateWithDuration:0.6 animations:^{
            self.shijianbeijing.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-self.shijianbeijing.bounds.size.height, self.shijianbeijing.frame.size.width, self.shijianbeijing.frame.size.height);
        }];
    }
    else
    {
        [UIView animateWithDuration:0.6 animations:^{
            self.shijianbeijing.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, self.shijianbeijing.frame.size.width, self.shijianbeijing.frame.size.height);
        }];
    }
}

-(void)HuiJia
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
