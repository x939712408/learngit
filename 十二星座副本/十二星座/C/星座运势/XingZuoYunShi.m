//
//  XingZuoYunShi.m
//  十二星座
//
//  Created by tarena on 16/6/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//
#import "XingZuoUtils.h"
#import "XingZuoYunShi.h"
#import "XingZuotoday.h"
#import "XingZuotomorrow.h"
#import "XIngZuoweek.h"
#import "XingZuonextweek.h"
#import "XingZuomonth.h"
#import "XingZuoyear.h"
#import "ViewController.h"
#import "XingZuoChaKan.h"
#import "MyTabbar.h"
#import "HuangLi.h"
#import "XingZuoPiPei.h"

@interface XingZuoYunShi ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)XingZuotoday* JinRi;
@property(nonatomic,strong)XingZuotomorrow* MingTian;
@property(nonatomic,strong)XIngZuoweek* XingQi;
@property(nonatomic,strong)XingZuonextweek* XiaXingQi;
@property(nonatomic,strong)XingZuomonth* YiYue;
@property(nonatomic,strong)XingZuoyear* YiNian;
@property (weak, nonatomic) IBOutlet UILabel *BiaoTI;
@property (weak, nonatomic) IBOutlet UILabel *XinYunYanSe;
@property (weak, nonatomic) IBOutlet UILabel *XinYunShuZi;
@property (weak, nonatomic) IBOutlet UILabel *SuPeiXIngZu0;
@property (weak, nonatomic) IBOutlet UILabel *RiQi;
@property (weak, nonatomic) IBOutlet UIImageView *XingZuoMeiTu;
@property (weak, nonatomic) IBOutlet UIButton *JinRiYunShi;
@property (weak, nonatomic) IBOutlet UIButton *MingRiXunShi;
@property (weak, nonatomic) IBOutlet UIImageView *DaDiImageview;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *MingPianBeiJing;
@property (nonatomic,strong) UITableViewCell *cell;
@property (weak, nonatomic) IBOutlet UIView *XinZuoXuanZe;
@property(nonatomic,assign,getter=_isXianshi) BOOL xianshi;
@property(nonatomic,assign,getter=_isBiaoTi) BOOL biaoti;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *XInGZuoButtns;
@property (weak, nonatomic) IBOutlet UIView *MingView;
@property (weak, nonatomic) IBOutlet UIView *JinView;
@property (weak, nonatomic) IBOutlet UIView *MingPianView;
@property (weak, nonatomic) IBOutlet UITableView *ALLTableView;
@property (weak, nonatomic) IBOutlet UIView *BeiJingXing;
@property (weak, nonatomic) IBOutlet UIView *JianKangXing;
@property (weak, nonatomic) IBOutlet UIView *CaiFuXing;
@property (weak, nonatomic) IBOutlet UIView *AiQingXing;
@property (weak, nonatomic) IBOutlet UIView *ZhengTiXing;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *XingZiDongBuJu;
@property (weak, nonatomic) IBOutlet UIImageView *XuanZeButtonBeiJing;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *XingZuoXuanZeButton;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *XuanZeButtonXianTiao;

@end

@implementation XingZuoYunShi

- (void)viewDidLoad {
    [super viewDidLoad];
    self.xianshi = NO;
    self.biaoti = YES;
    self.JinView.hidden = NO;
    [self HuoQuShuJuAndXIuGaiJieMian];
    self.navigationItem.title = [NSString stringWithFormat:@"%@运势",self.XingZuo] ;
      //添加导航中心选择星座按钮
    UIButton* but = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [but setTitleColor:[UIColor blueColor] forState:0];
    [but addTarget:self action:@selector(XingZuoLeiXing:) forControlEvents:UIControlEventTouchUpInside];
    [but setBackgroundImage:[UIImage imageNamed:@"xiajiantou"] forState:0];
    UIBarButtonItem* bar = [[UIBarButtonItem alloc]initWithCustomView:but];
    self.navigationItem.rightBarButtonItem = bar;
    self.JinRiYunShi.selected = YES;
    // 自动布局算法
    self.XuanZeButtonBeiJing.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/375*self.XuanZeButtonBeiJing.frame.origin.x, [UIScreen mainScreen].bounds.size.height/667*self.XuanZeButtonBeiJing.frame.origin.y, [UIScreen mainScreen].bounds.size.width/375*self.XuanZeButtonBeiJing.frame.size.width, [UIScreen mainScreen].bounds.size.height/667*self.XuanZeButtonBeiJing.frame.size.height);
    for (UIImageView* vi in self.XingZiDongBuJu) {
        vi.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/375*vi.frame.origin.x, [UIScreen mainScreen].bounds.size.height/667*vi.frame.origin.y, [UIScreen mainScreen].bounds.size.width/375*vi.frame.size.width, [UIScreen mainScreen].bounds.size.height/667*vi.frame.size.height);
    }
    for (UIButton* vi in self.XingZuoXuanZeButton) {
        vi.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/375*vi.frame.origin.x, [UIScreen mainScreen].bounds.size.height/667*vi.frame.origin.y, [UIScreen mainScreen].bounds.size.width/375*vi.frame.size.width, [UIScreen mainScreen].bounds.size.height/667*vi.frame.size.height);
    }
    for (UIView* vi in self.XuanZeButtonXianTiao) {
        vi.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/375*vi.frame.origin.x, [UIScreen mainScreen].bounds.size.height/667*vi.frame.origin.y, [UIScreen mainScreen].bounds.size.width/375*vi.frame.size.width, 1);
    }
    
}

//获取星座数据和修改部分页面
-(void)HuoQuShuJuAndXIuGaiJieMian
{
      __weak XingZuoYunShi* weakself = self;
     @autoreleasepool{
    [XingZuoUtils requestTokenWithName:self.XingZuo andZhongLei:@"today" andCallback:^(id obj) {
        weakself.JinRi = [[XingZuotoday alloc]initWithZiDian:obj];
        [weakself.ALLTableView reloadData];
        [weakself MingPianJieMian];
    }];
    
    [XingZuoUtils requestTokenWithName:self.XingZuo andZhongLei:@"tomorrow" andCallback:^(id obj) {
        weakself.MingTian = [[XingZuotomorrow alloc]initWithZiDian:obj];
        [weakself.ALLTableView reloadData];
        [weakself MingPianJieMian];
    }];
    [XingZuoUtils requestTokenWithName:self.XingZuo andZhongLei:@"week" andCallback:^(id obj) {
        weakself.XingQi = [[XIngZuoweek alloc]initWithZiDian:obj];
        [weakself.ALLTableView reloadData];
        [weakself MingPianJieMian];
    }];
    [XingZuoUtils requestTokenWithName:self.XingZuo andZhongLei:@"nextweek" andCallback:^(id obj) {
        weakself.XiaXingQi = [[XingZuonextweek alloc]initWithZiDian:obj];
        [weakself.ALLTableView reloadData];
        [weakself MingPianJieMian];
    }];
    [XingZuoUtils requestTokenWithName:self.XingZuo andZhongLei:@"month" andCallback:^(id obj) {
        weakself.YiYue = [[XingZuomonth alloc]initWithZiDian:obj];
        [weakself.ALLTableView reloadData];
        [weakself MingPianJieMian];
    }];
    [XingZuoUtils requestTokenWithName:self.XingZuo andZhongLei:@"year" andCallback:^(id obj) {
            weakself.YiNian = [[XingZuoyear alloc]initWithZiDian:obj];
        [weakself.ALLTableView reloadData];
         [weakself MingPianJieMian];
    }];
    }
    NSIndexPath *lastIndexPh = [NSIndexPath indexPathForRow:0 inSection:0];
    //确定哪个Cell置顶
    [self.ALLTableView scrollToRowAtIndexPath:lastIndexPh atScrollPosition:UITableViewScrollPositionTop animated:YES];
    [self SheZhiKongJianWaiXing];
}

//名片界面控件赋值
-(void)MingPianJieMian
{
    
    self.XingZuoMeiTu.image = [UIImage imageNamed:[NSString stringWithFormat:@"ys%.2lu",self.i]];
    self.DaDiImageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"bj%.2lu.jpg",self.i]];
    NSString* str = self._isBiaoTi?self.JinRiYunShi.titleLabel.text:self.MingRiXunShi.titleLabel.text;
    self.BiaoTI.text = [NSString stringWithFormat:@"%@%@",self.XingZuo,str];
    str = self._isBiaoTi?self.JinRi.color:self.MingTian.color;
    self.XinYunYanSe.text = [NSString stringWithFormat:@"幸运颜色:%@",str];
    self.XinYunShuZi.text = [NSString stringWithFormat:@"幸运数字:%@",self._isBiaoTi?self.JinRi.number:self.MingTian.number];
    str = self._isBiaoTi?self.JinRi.QFriend:self.MingTian.QFriend;
    self.SuPeiXIngZu0.text = [NSString stringWithFormat:@"速配星座:%@",str];
    self.RiQi.text =  self._isBiaoTi?self.JinRi.datetime:self.MingTian.datetime;
    
    self.ZhengTiXing.layer.masksToBounds =
    self.AiQingXing.layer.masksToBounds =
    self.CaiFuXing.layer.masksToBounds =
    self.JianKangXing.layer.masksToBounds = YES;
    double jinri = ((NSNumber*)[self.JinRi.all stringByReplacingOccurrencesOfString:@"%" withString:@""]).doubleValue/100;
    double mingtian = ((NSNumber*)[self.MingTian.all stringByReplacingOccurrencesOfString:@"%" withString:@""]).doubleValue/100;
        __weak XingZuoYunShi* weakself = self;
    [UIView animateWithDuration:1 animations:^{
        weakself.ZhengTiXing.frame = CGRectMake(weakself.ZhengTiXing.frame.origin.x, weakself.ZhengTiXing.frame.origin.y,weakself.BeiJingXing.frame.size.width*(weakself._isBiaoTi?jinri:mingtian), weakself.ZhengTiXing.frame.size.height);
    }];
    
    jinri = ((NSNumber*)[self.JinRi.love stringByReplacingOccurrencesOfString:@"%" withString:@""]).doubleValue/100;
    mingtian = ((NSNumber*)[self.MingTian.love stringByReplacingOccurrencesOfString:@"%" withString:@""]).doubleValue/100;
    [UIView animateWithDuration:1 animations:^{
        weakself.AiQingXing.frame = CGRectMake(weakself.AiQingXing.frame.origin.x, weakself.AiQingXing.frame.origin.y,weakself.BeiJingXing.frame.size.width*(weakself._isBiaoTi?jinri:mingtian), weakself.AiQingXing.frame.size.height);
    }];
    
    jinri = ((NSNumber*)[self.JinRi.money stringByReplacingOccurrencesOfString:@"%" withString:@""]).doubleValue/100;
    mingtian = ((NSNumber*)[self.MingTian.money stringByReplacingOccurrencesOfString:@"%" withString:@""]).doubleValue/100;
    [UIView animateWithDuration:1 animations:^{
        weakself.CaiFuXing.frame = CGRectMake(weakself.CaiFuXing.frame.origin.x, weakself.CaiFuXing.frame.origin.y,weakself.BeiJingXing.frame.size.width*(weakself._isBiaoTi?jinri:mingtian), weakself.CaiFuXing.frame.size.height);
    }];
    
    jinri = ((NSNumber*)[self.JinRi.health stringByReplacingOccurrencesOfString:@"%" withString:@""]).doubleValue/100;
    mingtian = ((NSNumber*)[self.MingTian.health stringByReplacingOccurrencesOfString:@"%" withString:@""]).doubleValue/100;
    [UIView animateWithDuration:1 animations:^{
        weakself.JianKangXing.frame = CGRectMake(weakself.JianKangXing.frame.origin.x, weakself.JianKangXing.frame.origin.y,weakself.BeiJingXing.frame.size.width*(weakself._isBiaoTi?jinri:mingtian), weakself.JianKangXing.frame.size.height);
    }];
    
    
}

//控件设置外形
-(void)SheZhiKongJianWaiXing
{
    self.XinZuoXuanZe.layer.masksToBounds =
    self.MingPianBeiJing.layer.masksToBounds=
    self.MingRiXunShi.layer.masksToBounds =
    self.JinRiYunShi.layer.masksToBounds =
    self.RiQi.layer.masksToBounds =
    self.XingZuoMeiTu.layer.masksToBounds = YES;
    self.RiQi.layer.cornerRadius = self.XingZuoMeiTu.layer.cornerRadius = 10;
    self.XinZuoXuanZe.layer.cornerRadius =50;
        self.MingPianBeiJing.layer.cornerRadius = 20;
    self.MingRiXunShi.layer.cornerRadius = self.JinRiYunShi.layer.cornerRadius = 8;
    self.XingZuoMeiTu.layer.borderWidth = 3;
    self.XingZuoMeiTu.layer.borderColor = [UIColor whiteColor].CGColor;
    
}

//弹出星座选择窗口
-(void)XingZuoLeiXing:(UIButton*)sender
{
    __weak XingZuoYunShi* weakself = self;
    if (self._isXianshi)
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"xiajiantou"] forState:0];
        [UIView animateWithDuration:0.5 animations:^{
            weakself.XinZuoXuanZe.frame =CGRectMake(weakself.XinZuoXuanZe.frame.origin.x, weakself.XinZuoXuanZe.frame.origin.y, weakself.XinZuoXuanZe.frame.size.width, 0);
        }completion:^(BOOL finished) {
            
        }];
        
        self.xianshi = NO;
    }else
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"shangjiantou"] forState:0];
        [UIView animateWithDuration:0.5 animations:^{
            weakself.XinZuoXuanZe.frame =CGRectMake(weakself.XinZuoXuanZe.frame.origin.x, weakself.XinZuoXuanZe.frame.origin.y, weakself.XinZuoXuanZe.frame.size.width, [UIScreen mainScreen].bounds.size.height/667*317);
        }];
        self.xianshi =YES;
    }
    
}

//星座选择
- (IBAction)XinZuoXuanZE:(UIButton *)sender
{
     __weak XingZuoYunShi* weakself = self;
    self.i = sender.tag;
    self.XingZuo = sender.titleLabel.text;
    self.navigationItem.title = [NSString stringWithFormat:@"%@运势",self.XingZuo] ;
    [self HuoQuShuJuAndXIuGaiJieMian];
    //    [self.ALLTableView reloadData];
    for (UIButton* but in self.XInGZuoButtns) {
        but.selected = NO;
    }
    sender.selected = YES;
    UIBarButtonItem* item = self.navigationItem.rightBarButtonItem;
    UIButton* bttn = (UIButton*)[item customView];
    [bttn setBackgroundImage:[UIImage imageNamed:@"xiajiantou"] forState:0];
    [UIView animateWithDuration:0.5 animations:^{
        weakself.XinZuoXuanZe.frame =CGRectMake(weakself.XinZuoXuanZe.frame.origin.x, weakself.XinZuoXuanZe.frame.origin.y, weakself.XinZuoXuanZe.frame.size.width, 0);
    }completion:^(BOOL finished) {
        self.xianshi = NO;
    }];

}
//今日或者明日运势
- (IBAction)JINMIngYunShi:(UIButton *)sender
{
    if(sender.tag == 0)
    {
        self.MingView.hidden = self.biaoti = YES;
        self.JinView.hidden = NO;
    }else
    {
        self.MingView.hidden = self.biaoti = NO;
        self.JinView.hidden = YES;
    }

    NSString* str = self._isBiaoTi?self.JinRiYunShi.titleLabel.text:self.MingRiXunShi.titleLabel.text;
    self.BiaoTI.text = [NSString stringWithFormat:@"%@%@",self.XingZuo,str];
    [self MingPianJieMian];
    [self.ALLTableView reloadData];
    self.JinRiYunShi.selected = self.MingRiXunShi.selected = NO;
    sender.selected = YES;
    
}

#pragma mark - 一问 tableView 有多少个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1 || section == 2 ||section == 3 || section == 4) {
        return 5;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell ==nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.numberOfLines = 0;
    switch (indexPath.section) {
        case 0:
            if (self._isBiaoTi) {
                 cell.textLabel.text = self.JinRi.summary;
            }else
            {
            cell.textLabel.text = self.MingTian.summary;
            }
            break;
        case 1:
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
        case 2:
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
        case 3:
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
        case 4:
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

//分区头文字
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return [NSString stringWithFormat:@"%@点评    %@",self.BiaoTI.text,self.RiQi.text];

            break;
        case 1:
             return [NSString stringWithFormat:@"本周%@运势点评   %@",self.XingZuo,self.XingQi.date];
            break;
        case 2:
             return [NSString stringWithFormat:@"下周%@运势点评   %@",self.XingZuo,self.XiaXingQi.date];
            break;
        case 3:
             return [NSString stringWithFormat:@"本月%@运势点评   %@",self.XingZuo,self.YiYue.date];
            break;
        case 4:
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
    CGSize retSize = [text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-10, CGFLOAT_MAX)
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
//    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    return [self getTextHeight: self.cell.textLabel.text];
  
}
//分区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return [UIScreen mainScreen].bounds.size.height/568*40;
}
//分区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 1;
}


-(void)dealloc
{
    NSLog(@"星座运势界面被释放");
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
