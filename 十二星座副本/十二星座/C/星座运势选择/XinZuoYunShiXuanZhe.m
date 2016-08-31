//
//  XinZuoYunShiXuanZhe.m
//  十二星座
//
//  Created by tarena on 16/6/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XinZuoYunShiXuanZhe.h"
#import "XingZuoUtils.h"
#import "XingZuoYunShi.h"
#import "XingZuotoday.h"
#import "XingZuotomorrow.h"
#import "XIngZuoweek.h"
#import "XingZuonextweek.h"
#import "XingZuomonth.h"
#import "XingZuoyear.h"
#import "UMSocial.h"
@interface XinZuoYunShiXuanZhe ()<UITableViewDataSource,UITableViewDelegate,UMSocialUIDelegate>
@property (weak, nonatomic) IBOutlet UIView *XuAnZeDaDi;
@property(nonatomic,strong) NSMutableArray* images;
@property(nonatomic,assign) int x;
@property(nonatomic,strong) NSString* XingzuoXuanZeSHU;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *ZuoGun;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *YouGun;

@property (weak, nonatomic) IBOutlet UILabel *BiaoTI;
@property (weak, nonatomic) IBOutlet UILabel *XinYunYanSe;
@property (weak, nonatomic) IBOutlet UILabel *XinYunShuZi;
@property (weak, nonatomic) IBOutlet UILabel *SuPeiXIngZu0;
@property (weak, nonatomic) IBOutlet UILabel *RiQi;
@property (weak, nonatomic) IBOutlet UIImageView *XingZuoMeiTu;
@property (weak, nonatomic) IBOutlet UITableView *ALLTableView;
@property (weak, nonatomic) IBOutlet UIView *BeiJingXing;
@property (weak, nonatomic) IBOutlet UIView *JianKangXing;
@property (weak, nonatomic) IBOutlet UIView *CaiFuXing;
@property (weak, nonatomic) IBOutlet UIView *AiQingXing;
@property (weak, nonatomic) IBOutlet UIView *ZhengTiXing;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *MingPianBeiJing;
@property (weak, nonatomic) IBOutlet UIImageView *DaDiImageview;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *RiQiButton;


@property(nonatomic,strong) NSString* XingZuo;
@property(nonatomic,assign,getter=_isBiaoTi) BOOL biaoti;
@property(nonatomic,strong) NSArray* xingzuoarr;
@property(nonatomic,assign) NSInteger XingZuomingpianGENxinSHU;
@property(nonatomic,strong)NSMutableArray* shuju;
@property(nonatomic,assign)NSInteger tag;
@property (nonatomic,strong) UITableViewCell *cell;

@property(nonatomic,strong)XingZuotoday* JinRi;
@property(nonatomic,strong)XingZuotomorrow* MingTian;
@property(nonatomic,strong)XIngZuoweek* XingQi;
@property(nonatomic,strong)XingZuonextweek* XiaXingQi;
@property(nonatomic,strong)XingZuomonth* YiYue;
@property(nonatomic,strong)XingZuoyear* YiNian;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *XingXingZiDongBuJu;
@end

@implementation XinZuoYunShiXuanZhe
-(NSArray*)xingzuoarr
{
    if (!_xingzuoarr)
    {
        _xingzuoarr = @[@"白羊座",@"金牛座",@"双子座",@"巨蟹座",@"狮子座",@"处女座",@"天秤座",@"天蝎座",@"射手座",@"摩羯座",@"水瓶座",@"双鱼座"];
    }
    return _xingzuoarr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.XingZuo = @"白羊座";
    self.x = 12000;
    self.biaoti = YES;
    self.images = [NSMutableArray array];
    UIImageView*view =[[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/375*18, [UIScreen mainScreen].bounds.size.height/667*22, [UIScreen mainScreen].bounds.size.width/375*73,[UIScreen mainScreen].bounds.size.height/667* 84)];
    view.image = [UIImage imageNamed:@"an10"];
    view.tag = 10;
     [self.images addObject:view];
    view.backgroundColor = [UIColor yellowColor];
     [self.XuAnZeDaDi addSubview:view];
    view =[[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/375*80, [UIScreen mainScreen].bounds.size.height/667*17, [UIScreen mainScreen].bounds.size.width/375*77, [UIScreen mainScreen].bounds.size.height/667*95)];
       view.image = [UIImage imageNamed:@"an11"];
      view.tag = 11;
     [self.images addObject:view];
    view.backgroundColor = [UIColor yellowColor];
     [self.XuAnZeDaDi addSubview:view];
    UIImageView* view2 =[[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/375*290, [UIScreen mainScreen].bounds.size.height/667*22, [UIScreen mainScreen].bounds.size.width/375*73,[UIScreen mainScreen].bounds.size.height/667* 84)];
    view2.image = [UIImage imageNamed:@"an02"];
      view2.tag = 2;
    view2.backgroundColor = [UIColor yellowColor];
    [self.XuAnZeDaDi addSubview:view2];
    
    UIImageView* view1 =[[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/375*225, [UIScreen mainScreen].bounds.size.height/667*17, [UIScreen mainScreen].bounds.size.width/375*77, [UIScreen mainScreen].bounds.size.height/667*95)];
    view1.image = [UIImage imageNamed:@"an01"];
      view1.tag = 1;
    view1.backgroundColor = [UIColor yellowColor];
    [self.XuAnZeDaDi addSubview:view1];
    view =[[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/375*149,[UIScreen mainScreen].bounds.size.height/667* 9, [UIScreen mainScreen].bounds.size.width/375*85, [UIScreen mainScreen].bounds.size.height/667*110)];
       view.image = [UIImage imageNamed:@"an00"];
      view.tag =0;
     [self.images addObject:view];
    view.backgroundColor = [UIColor yellowColor];
     [self.XuAnZeDaDi addSubview:view];
       [self.images addObject:view1];
      [self.images addObject:view2];
    for (UIImageView*view in self.images)
    {
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = view.bounds.size.width/4;
        view.layer.borderWidth = 3;
        view.layer.borderColor = [UIColor blackColor].CGColor;
    }
    [self HuoQuShuJuAndXIuGaiJieMian];
    //自动布局算法
    for (UIImageView* vi in self.XingXingZiDongBuJu) {
        vi.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/375*vi.frame.origin.x, [UIScreen mainScreen].bounds.size.height/667*vi.frame.origin.y, [UIScreen mainScreen].bounds.size.width/375*vi.frame.size.width, [UIScreen mainScreen].bounds.size.height/667*vi.frame.size.height);
    }
    //添加分享按钮
    UIBarButtonItem* fenxiang  = [[UIBarButtonItem alloc]initWithTitle:@"分享" style:0 target:self action:@selector(fenxiang)];
    self.navigationItem.rightBarButtonItem = fenxiang;
    
 
}
//分享
-(void)fenxiang
{

    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"579f3c40e0f55af641001e78"
                                      shareText:@"SIGN让您更懂您的星座."
                                     shareImage:[UIImage imageNamed:@"LOGO"]
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQQ,UMShareToQzone]
                                       delegate:self];

}
+(UIImage *)getImageFromView:(UIView *)view{
    //创建一个画布
    UIGraphicsBeginImageContext(view.bounds.size);
    //把view的内容渲染到画布中
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    //把图片从画布中取出
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束操作 释放内存
    UIGraphicsEndImageContext();
    
    return image;
}

//向右滚动切换星座
- (IBAction)RightGunDong:(UISwipeGestureRecognizer *)sender
{
    self.ZuoGun.enabled = NO;
    self.YouGun.enabled =NO;
     __block NSInteger i = 0;
    UIImageView* view =[[UIImageView alloc]initWithFrame:CGRectMake(-100, 22, 73, 84)];
    view.alpha =0;
    self.x -=3;
    view.tag = self.x%12;
    view.image = [UIImage imageNamed:[NSString stringWithFormat:@"an%.2d",self.x--%12]];
    [self.images insertObject:view atIndex:0];
    view.backgroundColor = [UIColor yellowColor];
    [self.XuAnZeDaDi addSubview:view];
    [self.XuAnZeDaDi sendSubviewToBack:view];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = view.bounds.size.width/4;
    view.layer.borderWidth = 3;
    view.layer.borderColor = [UIColor blackColor].CGColor;
    [UIView animateWithDuration:0.7 animations:^{
         view.alpha =1;
        for (; i<self.images.count-1; i++)
        {
            ((UIImageView*)self.images[i]).frame= ((UIImageView*)self.images [i+1]).frame;
        }
        ((UIImageView*)self.images[i]).frame= CGRectMake(500,  ((UIImageView*)self.images[i]).frame.origin.y,  ((UIImageView*)self.images[i]).frame.size.width,  ((UIImageView*)self.images[i]).frame.size.height);
        ((UIImageView*)self.images[i]).alpha = 0;
        [self.XuAnZeDaDi bringSubviewToFront:((UIImageView*)self.images[2])];
        }completion:^(BOOL finished) {
            UIImageView*view = self.images.lastObject;
            [view removeFromSuperview];
            [self.images removeObject:view];
            self.ZuoGun.enabled = YES;
            self.YouGun.enabled =YES;
        }];
      self.x +=3;
     self.XingZuo = self.xingzuoarr[((UIImageView*)self.images[2]).tag];
    self.XingZuomingpianGENxinSHU =((UIImageView*)self.images[2]).tag;
    [self HuoQuShuJuAndXIuGaiJieMian];
   
}

//向左滚动切换星族

- (IBAction)LlftGunDong:(UISwipeGestureRecognizer *)sender
{
    self.ZuoGun.enabled = NO;
    self.YouGun.enabled =NO;
    UIImageView* view =[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width, 22, 73, 84)];
    [self.images addObject:view];
    view.backgroundColor = [UIColor yellowColor];
    view.alpha =0;
    self.x +=3;
    view.tag = self.x%12;
    view.image = [UIImage imageNamed:[NSString stringWithFormat:@"an%.2d",self.x++%12]];
    [self.XuAnZeDaDi addSubview:view];
    [self.XuAnZeDaDi sendSubviewToBack:view];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = view.bounds.size.width/4;
    view.layer.borderWidth = 3;
    view.layer.borderColor = [UIColor blackColor].CGColor;
      __block NSInteger i =self.images.count-1;
    [UIView animateWithDuration:0.7 animations:^{
        view.alpha = 1;
        for (; i>0; i--)
        {
            ((UIImageView*)self.images[i]).frame= ((UIImageView*)self.images [i-1]).frame;
        }
        ((UIImageView*)self.images[i]).frame= CGRectMake(0-((UIImageView*)self.images[i]).frame.size.width,  ((UIImageView*)self.images[i]).frame.origin.y,  ((UIImageView*)self.images[i]).frame.size.width,  ((UIImageView*)self.images[i]).frame.size.height);
        ((UIImageView*)self.images[i]).alpha =0;
        [self.XuAnZeDaDi bringSubviewToFront:((UIImageView*)self.images[3])];
        }
                     completion:^(BOOL finished)
        {
            UIImageView*view = self.images.firstObject;
            [view removeFromSuperview];
            [self.images removeObject:view];
            self.ZuoGun.enabled = YES;
            self.YouGun.enabled =YES;
        }];
        self.x -=3;
    self.XingZuomingpianGENxinSHU =((UIImageView*)self.images[3]).tag;
    self.XingZuo = self.xingzuoarr[((UIImageView*)self.images[3]).tag];
    [self HuoQuShuJuAndXIuGaiJieMian];

}

//获取数据
-(void)HuoQuShuJuAndXIuGaiJieMian
{
    self.shuju = [NSMutableArray array];
    @autoreleasepool{
        [XingZuoUtils requestTokenWithName:self.XingZuo andZhongLei:@"today" andCallback:^(id obj) {
            self.JinRi = [[XingZuotoday alloc]initWithZiDian:obj];
            [self.shuju addObject:self.JinRi];
            [self ShuaXinTABLE];
           
        }];
        
        [XingZuoUtils requestTokenWithName:self.XingZuo andZhongLei:@"tomorrow" andCallback:^(id obj) {
            self.MingTian = [[XingZuotomorrow alloc]initWithZiDian:obj];
            [self.shuju addObject:self.MingTian];
              [self ShuaXinTABLE];
            
        }];
        [XingZuoUtils requestTokenWithName:self.XingZuo andZhongLei:@"week" andCallback:^(id obj) {
            self.XingQi = [[XIngZuoweek alloc]initWithZiDian:obj];
            [self.shuju addObject:self.XingQi];
              [self ShuaXinTABLE];
                    }];
        [XingZuoUtils requestTokenWithName:self.XingZuo andZhongLei:@"nextweek" andCallback:^(id obj) {
            self.XiaXingQi = [[XingZuonextweek alloc]initWithZiDian:obj];
              [self.shuju addObject:self.XiaXingQi];
                [self ShuaXinTABLE];
        }];
        [XingZuoUtils requestTokenWithName:self.XingZuo andZhongLei:@"month" andCallback:^(id obj) {
            self.YiYue = [[XingZuomonth alloc]initWithZiDian:obj];
            [self.shuju addObject:self.YiYue];
              [self ShuaXinTABLE];

        }];
        [XingZuoUtils requestTokenWithName:self.XingZuo andZhongLei:@"year" andCallback:^(id obj) {
            self.YiNian = [[XingZuoyear alloc]initWithZiDian:obj];
            [self.shuju addObject:self.YiNian];
              [self ShuaXinTABLE];

        }];
    }
    [self SheZhiKongJianWaiXing];
}

//刷新TABLE
-(void)ShuaXinTABLE
{
    NSIndexPath *lastIndexPh = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.ALLTableView reloadData];
    [self MingPianJieMian];
    //确定哪个Cell置顶
    [self.ALLTableView scrollToRowAtIndexPath:lastIndexPh atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

//名片界面控件赋值
-(void)MingPianJieMian
{
    
    self.XingZuoMeiTu.image = [UIImage imageNamed:[NSString stringWithFormat:@"ys%.2lu",self.XingZuomingpianGENxinSHU]];
    self.DaDiImageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"ys%.2lu",self.XingZuomingpianGENxinSHU]];
    NSString* str2 = self._isBiaoTi?@"今日":@"明日";
    self.BiaoTI.text = [NSString stringWithFormat:@"%@%@运势",self.XingZuo,str2];
     NSString* str1 = self._isBiaoTi?self.JinRi.color:self.MingTian.color;
    self.XinYunYanSe.text = [NSString stringWithFormat:@"幸运颜色:%@",str1];
    self.XinYunShuZi.text = [NSString stringWithFormat:@"幸运数字:%@",self._isBiaoTi?self.JinRi.number:self.MingTian.number];
     NSString* str = self._isBiaoTi?self.JinRi.QFriend:self.MingTian.QFriend;
    self.SuPeiXIngZu0.text = [NSString stringWithFormat:@"速配星座:%@",str];
    self.RiQi.text =  self._isBiaoTi?self.JinRi.datetime:self.MingTian.datetime;
    double jinri = ((NSNumber*)[self.JinRi.all stringByReplacingOccurrencesOfString:@"%" withString:@""]).doubleValue/100;
    double mingtian = ((NSNumber*)[self.MingTian.all stringByReplacingOccurrencesOfString:@"%" withString:@""]).doubleValue/100;
    [UIView animateWithDuration:1 animations:^{
        self.ZhengTiXing.frame = CGRectMake(self.ZhengTiXing.frame.origin.x, self.ZhengTiXing.frame.origin.y,self.BeiJingXing.frame.size.width*(self._isBiaoTi?jinri:mingtian), self.ZhengTiXing.frame.size.height);
    }];
    
    jinri = ((NSNumber*)[self.JinRi.love stringByReplacingOccurrencesOfString:@"%" withString:@""]).doubleValue/100;
    mingtian = ((NSNumber*)[self.MingTian.love stringByReplacingOccurrencesOfString:@"%" withString:@""]).doubleValue/100;
    [UIView animateWithDuration:1 animations:^{
        self.AiQingXing.frame = CGRectMake(self.AiQingXing.frame.origin.x, self.AiQingXing.frame.origin.y,self.BeiJingXing.frame.size.width*(self._isBiaoTi?jinri:mingtian), self.AiQingXing.frame.size.height);
    }];
    
    jinri = ((NSNumber*)[self.JinRi.money stringByReplacingOccurrencesOfString:@"%" withString:@""]).doubleValue/100;
    mingtian = ((NSNumber*)[self.MingTian.money stringByReplacingOccurrencesOfString:@"%" withString:@""]).doubleValue/100;
    [UIView animateWithDuration:1 animations:^{
        self.CaiFuXing.frame = CGRectMake(self.CaiFuXing.frame.origin.x, self.CaiFuXing.frame.origin.y,self.BeiJingXing.frame.size.width*(self._isBiaoTi?jinri:mingtian), self.CaiFuXing.frame.size.height);
    }];
    
    jinri = ((NSNumber*)[self.JinRi.health stringByReplacingOccurrencesOfString:@"%" withString:@""]).doubleValue/100;
    mingtian = ((NSNumber*)[self.MingTian.health stringByReplacingOccurrencesOfString:@"%" withString:@""]).doubleValue/100;
    [UIView animateWithDuration:1 animations:^{
        self.JianKangXing.frame = CGRectMake(self.JianKangXing.frame.origin.x, self.JianKangXing.frame.origin.y,self.BeiJingXing.frame.size.width*(self._isBiaoTi?jinri:mingtian), self.JianKangXing.frame.size.height);
    }];
    
}

//控件设置外形
-(void)SheZhiKongJianWaiXing
{
    for (UIButton* but in self.RiQiButton) {
        but.layer.masksToBounds = YES;
        but.layer.cornerRadius = 5;
    }
    self.XuAnZeDaDi.layer.masksToBounds =
    self.ZhengTiXing.layer.masksToBounds =
    self.AiQingXing.layer.masksToBounds =
    self.CaiFuXing.layer.masksToBounds =
    self.JianKangXing.layer.masksToBounds =
    self.ALLTableView.layer.masksToBounds=
    self.MingPianBeiJing.layer.masksToBounds=
    self.RiQi.layer.masksToBounds =
    self.XingZuoMeiTu.layer.masksToBounds = YES;
    self.XuAnZeDaDi.layer.cornerRadius = self.ALLTableView.layer.cornerRadius = self.RiQi.layer.cornerRadius = self.XingZuoMeiTu.layer.cornerRadius = 10;
    self.MingPianBeiJing.layer.cornerRadius = 20;
    self.XingZuoMeiTu.layer.borderWidth = 3;
    self.XingZuoMeiTu.layer.borderColor = [UIColor whiteColor].CGColor;
    
}
- (IBAction)RiQIButton:(UIButton *)sender
{
    self.tag = sender.tag;
    if (sender.tag == 1) {
        self.biaoti =NO;
    }else if(sender.tag == 0)
    {
        self.biaoti =YES;
    }
    for (UIButton* button in self.RiQiButton) {
        button.selected = NO;
    }
    sender.selected = YES;
    [self HuoQuShuJuAndXIuGaiJieMian];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.tag == 2 || self.tag == 3 ||self.tag == 4 || self.tag == 5) {
        return 5;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.numberOfLines = 0;
    switch (self.tag) {
            case 0:
                    cell.textLabel.text = self.JinRi.summary;
                break;
            case 1:
                cell.textLabel.text = self.MingTian.summary;
                break;

            case 2:
                if (indexPath.row == 0)
                {
                    cell.textLabel.text = self.XingQi.health;
                }else if(indexPath.row == 1)
                {
                    cell.textLabel.text = self.XingQi.job;
                }else if(indexPath.row == 2)
                {
                    cell.textLabel.text = self.XingQi.love;
                }else if(indexPath.row == 3)
                {
                    cell.textLabel.text = self.XingQi.money;
                }else if(indexPath.row == 4)
                {
                    cell.textLabel.text = self.XingQi.work;
                }
                break;
            case 3:
                if (indexPath.row == 0)
                {
                    cell.textLabel.text = self.XiaXingQi.health;
                }else if(indexPath.row == 1)
                {
                    cell.textLabel.text = self.XiaXingQi.job;
                }else if(indexPath.row == 2)
                {
                    cell.textLabel.text = self.XiaXingQi.love;
                }else if(indexPath.row == 3)
                {
                    cell.textLabel.text = self.XiaXingQi.money;
                }else if(indexPath.row == 4)
                {
                    cell.textLabel.text = self.XiaXingQi.work;
                }
                break;
            case 4:
                if (indexPath.row == 0)
                {
                    cell.textLabel.text = self.YiYue.all;
                }else if(indexPath.row == 1)
                {
                    cell.textLabel.text = self.YiYue.health;
                }else if(indexPath.row == 2)
                {
                    cell.textLabel.text = self.YiYue.love;
                }else if(indexPath.row == 3)
                {
                    cell.textLabel.text = self.YiYue.money;
                }else if(indexPath.row == 4)
                {
                    cell.textLabel.text = self.YiYue.work;
                }            break;
            case 5:
                if (indexPath.row == 0)
                {
                    cell.textLabel.text = self.YiNian.text;
                }else if(indexPath.row == 1)
                {
                    cell.textLabel.text = self.YiNian.career;
                }else if(indexPath.row == 2)
                {
                    cell.textLabel.text = self.YiNian.love;
                }else if(indexPath.row == 3)
                {
                    cell.textLabel.text = self.YiNian.health;
                }else if(indexPath.row == 4)
                {
                    cell.textLabel.text = self.YiNian.finance;
                }
                break;
                
            default:
                break;
            }
    self.cell = cell;
    return cell;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (self.tag) {
        case 0:
            return [NSString stringWithFormat:@"%@点评    %@",self.BiaoTI.text,self.JinRi.datetime];
            
            break;
        case 1:
            return [NSString stringWithFormat:@"%@点评    %@",self.BiaoTI.text,self.MingTian.datetime];
            
            break;
        case 2:
            return [NSString stringWithFormat:@"本周%@运势点评   %@",self.XingZuo,self.XingQi.date];
            break;
        case 3:
            return [NSString stringWithFormat:@"下周%@运势点评   %@",self.XingZuo,self.XiaXingQi.date];
            break;
        case 4:
            return [NSString stringWithFormat:@"本月%@运势点评   %@",self.XingZuo,self.YiYue.date];
            break;
        case 5:
            return [NSString stringWithFormat:@"今年%@运势点评   %@",self.XingZuo,self.YiNian.date];
            break;
            
        default:
            break;
    }
    return @"分区头";
}
-(float)getTextHeight:(NSString*)text{
    
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:19]};
    
    
    //计算文本高度
    CGSize retSize = [text boundingRectWithSize:CGSizeMake(self.ALLTableView.bounds.size.width-10, CGFLOAT_MAX)
                                        options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    
    return retSize.height;
    
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if ([self getTextHeight:self.cell.textLabel.text] < 44) {
        return 50;
    }
    
    return [self getTextHeight:self.cell.textLabel.text];
    
}
//分区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return [UIScreen mainScreen].bounds.size.height/667*50;
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
