//
//  XingZuoNanNv.m
//  十二星座
//
//  Created by tarena on 16/6/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XingZuoNanNv.h"
#import "XingZuoNAN.h"
#import "XingZuoNV.h"
#import "XingZuoYunShi.h"
#import "XingZuoUtils.h"
#import "XingZuotoday.h"

@interface XingZuoNanNv ()
@property (weak, nonatomic) IBOutlet UILabel *TDTable;
@property (weak, nonatomic) IBOutlet UILabel *RDTable;
@property (weak, nonatomic) IBOutlet UILabel *AQTable;
@property (weak, nonatomic) IBOutlet UILabel *NRJSTable;
@property (weak, nonatomic) IBOutlet UIImageView *TouImageView;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *OneChuanGKou;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *TowChuanGKou;
@property (weak, nonatomic) IBOutlet UIView *NVview;
@property (weak, nonatomic) IBOutlet UIView *NANview;
@property (weak, nonatomic) IBOutlet UIButton *NanButton;
@property (weak, nonatomic) IBOutlet UIButton *NvButton;
@property (weak, nonatomic) IBOutlet UILabel *XingZuoYunShiMing;
@property (weak, nonatomic) IBOutlet UILabel *JinRiYunShiZongPian;
@property (weak, nonatomic) IBOutlet UIView *WuXingFen;
@property (weak, nonatomic) IBOutlet UIView *WuXingKong;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *XingZu;

@end

@implementation XingZuoNanNv

- (void)viewDidLoad {
    [super viewDidLoad];
    //区别进去时是选择什么性别界面
    [self QuFenNANNV];
         __weak XingZuoNanNv* weakself = self;
    self.WuXingFen.layer.masksToBounds= YES;
    //自动布局算法
    for (UIImageView* vi in self.XingZu) {
        vi.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/375*vi.frame.origin.x, [UIScreen mainScreen].bounds.size.height/667*vi.frame.origin.y, [UIScreen mainScreen].bounds.size.width/375*vi.frame.size.width, [UIScreen mainScreen].bounds.size.height/667*vi.frame.size.height);
    }
    [XingZuoUtils requestTokenWithName:self.xzm andZhongLei:@"today" andCallback:^(id obj) {
        XingZuotoday* xz = [[XingZuotoday alloc]initWithZiDian:obj];
        weakself.JinRiYunShiZongPian.text = xz.summary;
        double d = ((NSNumber*)[xz.all stringByReplacingOccurrencesOfString:@"%" withString:@""]).doubleValue/100;
        [UIView animateWithDuration:1 animations:^{
        weakself.WuXingFen.frame = CGRectMake(weakself.WuXingFen.frame.origin.x, weakself.WuXingFen.frame.origin.y,weakself.WuXingKong.frame.size.width*d, weakself.WuXingFen.frame.size.height);
        }];
       

    }];


}

//区别男女星座
-(void)QuFenNANNV
{
    switch (self.xb) {
        case _nan:
            //调用给控件赋值方法
            [self FuZhiKongJian];
            self.NANview.hidden = NO;
            break;
        case _nv:
            //调用给控件赋值方法
            [self FuZhiKongJian];
            self.NVview.hidden = NO;
            break;
            
        default:
            break;
    }
    
}
//给界面控件赋值
-(void)FuZhiKongJian
{
    //给界面控件赋值
    switch (self.xb) {
        case _nan:
        {
            XingZuoNAN* _NAN = [[XingZuoNAN alloc]initWith];
            XingZuoNAN*nan = _NAN.xingzuonanS[self.i];
            self.TDTable.text = nan.td;
            self.RDTable.text = nan.rd;
            self.AQTable.text = nan.aq;
            self.NRJSTable.text = nan.nrjs;
            self.view.backgroundColor = [[UIColor alloc]initWithRed:((NSString*)nan.ys[0]).doubleValue/255 green:((NSString*)nan.ys[1]).doubleValue/255  blue:((NSString*)nan.ys[2]).doubleValue/255  alpha:1];
            self.TouImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"nan%.2lu",self.i]];
        }
            break;
        case _nv:
        {
            XingZuoNV* _NV = [[XingZuoNV alloc]initWith];
            XingZuoNV* nv = _NV.xingzuonvS[self.i];
            self.TDTable.text = nv.td;
            self.RDTable.text = nv.rd;
            self.AQTable.text = nv.aq;
            self.NRJSTable.text = nv.nrjs;
            self.view.backgroundColor = [[UIColor alloc]initWithRed:((NSString*)nv.ys[0]).doubleValue/255 green:((NSString*)nv.ys[1]).doubleValue/255  blue:((NSString*)nv.ys[2]).doubleValue/255  alpha:1];
            self.TouImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"nv%.2lu",self.i]];
        }
            break;
            
        default:
            break;
    }
    
    [self.NanButton setTitle:[NSString stringWithFormat:@"%@男生",self.xzm] forState:0];
    [self.NvButton setTitle:[NSString stringWithFormat:@"%@女生",self.xzm] forState:0];
    self.XingZuoYunShiMing.text =[NSString stringWithFormat:@"%@今日运势",self.xzm];
    //给界面窗口倒圆角
    self.TouImageView.layer.masksToBounds =
    self.NanButton.layer.masksToBounds =
    self.NvButton.layer.masksToBounds =
    self.OneChuanGKou.layer.masksToBounds =
    self.TowChuanGKou.layer.masksToBounds = YES;
    self.TouImageView.layer.cornerRadius =
    self.NanButton.layer.cornerRadius =
    self.NvButton.layer.cornerRadius =5;
     self.OneChuanGKou.layer.cornerRadius =
    self.TowChuanGKou.layer.cornerRadius =10;

    
}
//男女星座切换
- (IBAction)NANNVButton:(UIButton *)sender
{
    switch (sender.tag) {
        case 0:
            self.xb = _nv;
            self.NANview.hidden = YES;
            self.NVview.hidden = NO;
            break;
        case 1:
            self.xb = _nan;
            self.NVview.hidden = YES;
            self.NANview.hidden = NO;
            break;
            
        default:
            break;
    }
    [self FuZhiKongJian];
}
//星座运势跳转
- (IBAction)YunShiTiaoZhuan:(UIButton *)sender
{
    XingZuoYunShi* xzys = [[XingZuoYunShi alloc]init];
    xzys.XingZuo = self.xzm;
    xzys.i = self.i;
    [self.navigationController pushViewController:xzys animated:YES];
}

//返回界面
- (IBAction)FanHui:(UIButton *)sender
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
