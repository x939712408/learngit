//
//  RiJi.m
//  十二星座
//
//  Created by tarena on 16/6/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RiJi.h"
#import "YYTextView.h"
#import "MBProgressHUD.h"
#import "TZImagePickerController.h"
@interface RiJi ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate,TZImagePickerControllerDelegate>

@property (nonatomic, strong)YYTextView *textView;
@property (nonatomic, strong)RiJiWenZhang* RJwenzhang;
@property(nonatomic,assign)double ZITIDAXIAO;
@property(nonatomic,assign)double XINGQINGZHISHU;

@property (weak, nonatomic) IBOutlet UIButton *YanSebutton;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *YanSeKai;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *ZiTiDaXiao;
@property (weak, nonatomic) IBOutlet UIButton *ZiTiDaXiaoKAIGUAN;
@property (weak, nonatomic) IBOutlet UIImageView *BeiJing;
@property (weak, nonatomic) IBOutlet UIButton *AiQingKaiGuan;
@property (weak, nonatomic) IBOutlet UIButton *XinQingKaiGuan;
@property (weak, nonatomic) IBOutlet UIButton *TianQiKaiGuan;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *AiQingZhiShu;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *XinQingDengJi;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *TianQiQingKuang;
@property (weak, nonatomic) IBOutlet UILabel *XinQingXianShi;
@property (weak, nonatomic) IBOutlet UILabel *AiQingXianShi;
@property (weak, nonatomic) IBOutlet UILabel *TianQIXianShi;
@property (weak, nonatomic) IBOutlet UIImageView *ZhaoPian;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *SheZhiZhaoPianBeiJing;
@property (weak, nonatomic) IBOutlet UIButton *ZhaoPianButton;

@end

@implementation RiJi

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardFrameChangeAction:) name:UIKeyboardWillChangeFrameNotification object:nil];
    self.textView =[[YYTextView alloc]initWithFrame:CGRectMake(self.textView.frame.origin.x,CGRectGetMaxY( self.AiQingXianShi.frame)+10, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.textView];
    self.textView.font = [UIFont systemFontOfSize:20];
    self.ZITIDAXIAO = 20;
    self.textView.textColor = [UIColor redColor];
    [self ANJIANYangShi];
    [self.view insertSubview:self.textView atIndex:1];
    self.BeiJing.userInteractionEnabled = YES;
    //按指定的格式输出时间
    //1.创建一个时间的格式化对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    //2.指定时间的转换格式
    //HH表示24小时制，hh表示12小时制
    formatter.dateFormat = @"yyyy年MM月dd日";
    //日期转字符串
    NSString *dateString = [formatter stringFromDate:[NSDate date]];
    self.navigationItem.title =dateString;
    UIBarButtonItem* WanCheng = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(WanCheng)];
    UIBarButtonItem* XiangCe = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(XiangJi)];
    self.navigationItem.rightBarButtonItems = @[WanCheng,XiangCe];
    self.ZhaoPian.userInteractionEnabled = YES;

}

//设置按键样式
-(void)ANJIANYangShi
{
    self.ZhaoPian.layer.masksToBounds =
    self.ZhaoPianButton.layer.masksToBounds =
    self.YanSebutton.layer.masksToBounds =
    self.ZiTiDaXiaoKAIGUAN.layer.masksToBounds = YES;
    self.YanSebutton.layer.cornerRadius =
    self.ZhaoPianButton.layer.cornerRadius =
    self.ZhaoPian.layer.cornerRadius =
    self.ZiTiDaXiaoKAIGUAN.layer.cornerRadius = 10;
    for (UIButton* but in self.YanSeKai) {
        but.layer.masksToBounds = YES;
        but.layer.cornerRadius = but.bounds.size.width/2;
    }
    for (UIButton* but in self.ZiTiDaXiao) {
        but.layer.masksToBounds = YES;
        but.layer.cornerRadius = 5;
    }
    for (UIButton* but in self.AiQingZhiShu) {
        but.layer.masksToBounds = YES;
        but.layer.cornerRadius = 5;
    }
    for (UIButton* but in self.XinQingDengJi) {
        but.layer.masksToBounds = YES;
        but.layer.cornerRadius = 5;
    }
    for (UIButton* but in self.TianQiQingKuang) {
        but.layer.masksToBounds = YES;
        but.layer.cornerRadius = 5;
    }
}

-(void)keyboardFrameChangeAction:(NSNotification *)noti{
    
  //  NSLog(@"%@",noti);
    CGRect keyboradFrame =  [noti.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    
    if (keyboradFrame.origin.y==self.view.bounds.size.height) {//收软键盘

        self.textView.transform = CGAffineTransformIdentity;
        for (UIButton* but in self.YanSeKai) {
            but.hidden = YES;
        }
        for (UIButton* but in self.ZiTiDaXiao) {
            but.hidden = YES;
        }

        self.ZiTiDaXiaoKAIGUAN.hidden = self.YanSebutton.hidden = YES;
    }else{//软键盘弹出
        self.YanSebutton.frame =CGRectMake(self.YanSebutton.frame.origin.x, self.view.frame.size.height-keyboradFrame.size.height-self.YanSebutton.frame.size.height, self.YanSebutton.frame.size.width,self.YanSebutton.frame.size.height);
        //颜色按钮位置设置
        for (UIButton* but in self.YanSeKai) {
            but.frame =CGRectMake(but.frame.origin.x, self.YanSebutton.frame.origin.y, but.frame.size.width,but.frame.size.height);
        }
        for (UIButton* but in self.ZiTiDaXiao) {
            but.frame =CGRectMake(but.frame.origin.x, self.YanSebutton.frame.origin.y-but.frame.size.height-2, but.frame.size.width,but.frame.size.height);
        }
          self.ZiTiDaXiaoKAIGUAN.frame =CGRectMake(self.ZiTiDaXiaoKAIGUAN.frame.origin.x, self.YanSebutton.frame.origin.y-self.ZiTiDaXiaoKAIGUAN.frame.size.height-2, self.ZiTiDaXiaoKAIGUAN.frame.size.width,self.ZiTiDaXiaoKAIGUAN.frame.size.height);
        //文本输入框

        self.textView.frame = CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y, self.textView.frame.size.width, self.ZiTiDaXiaoKAIGUAN.frame.origin.y-64-5-self.AiQingXianShi.bounds.size.height-10);
        self.ZiTiDaXiaoKAIGUAN.hidden = self.YanSebutton .hidden= NO;
    }
    
    
}
- (IBAction)XianShiYanSe:(UIButton *)sender
{
    for (UIButton* but in self.YanSeKai) {
        but.hidden = !but.isHidden;
    }
    for (UIButton* but in self.ZiTiDaXiao) {
        but.hidden = YES;
    }
}
- (IBAction)SheZhiZiTi:(UIButton *)sender
{
    for (UIButton* but in self.ZiTiDaXiao) {
        but.hidden = !but.isHidden;
    }
    for (UIButton* but in self.YanSeKai) {
        but.hidden = YES;
    }
}
//设置字体大小
- (IBAction)SheZhiZITiDaXiao:(UIButton *)sender
{
    self.textView.font = [UIFont systemFontOfSize:sender.tag];
    self.ZITIDAXIAO = sender.tag;
}
//  设置字体颜色
- (IBAction)SheZhiZiTiYanSe:(UIButton *)sender
{
       self.textView.textColor =sender.backgroundColor;
}
//显示爱情选项

- (IBAction)XianShiAiQing:(UIButton *)sender
{
    for (UIButton* but in self.AiQingZhiShu) {
        but.hidden = !but.isHidden;
    }
    for (UIButton* but in self.XinQingDengJi) {
        but.hidden = YES;
    }
    for (UIButton* but in self.TianQiQingKuang) {
        but.hidden = YES;
    }
}
//显示心情选项
- (IBAction)XianShiXinQing:(UIButton *)sender
{
    for (UIButton* but in self.AiQingZhiShu) {
        but.hidden = YES;
    }
    for (UIButton* but in self.XinQingDengJi) {
        but.hidden = !but.isHidden;
    }
    for (UIButton* but in self.TianQiQingKuang) {
        but.hidden = YES;
    }
}
//显示天气
- (IBAction)XianShiTianQi:(UIButton *)sender
{
    for (UIButton* but in self.AiQingZhiShu) {
        but.hidden = YES;
    }
    for (UIButton* but in self.XinQingDengJi) {
        but.hidden = YES;
    }
    for (UIButton* but in self.TianQiQingKuang) {
        but.hidden = !but.isHidden;
    }
}
//爱情指数
- (IBAction)AiQingZhiShu:(UIButton *)sender
{
    self.AiQingXianShi.text = sender.titleLabel.text;
    for (UIButton* but in self.AiQingZhiShu) {
        but.hidden = YES;
    }
}

//心情等级
- (IBAction)XinQingDengJi:(UIButton *)sender
{
    self.XinQingXianShi.text = sender.titleLabel.text;
    self.XINGQINGZHISHU = sender.tag;
    for (UIButton* but in self.XinQingDengJi) {
        but.hidden = YES;
    }
}
//天气显示
- (IBAction)TianQi:(UIButton *)sender
{
    self.TianQIXianShi.text = sender.titleLabel.text;
    for (UIButton* but in self.TianQiQingKuang) {
        but.hidden = YES;
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view becomeFirstResponder];
}

-(void)XiangJi
{
    self.SheZhiZhaoPianBeiJing.hidden = NO;
    [self.view endEditing:YES];
}

//进入相册
- (IBAction)JInRuZhaoPian:(UITapGestureRecognizer *)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:NO] forKey:@"panduan"];
       [defaults synchronize];
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    imagePickerVc.allowPickingVideo = NO;
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos,NSArray *assets,BOOL isSelectOriginalPhoto) {
        UIImage *image = photos[0];
        NSData* data = [self resetSizeOfImageData:image maxSize:0];
        NSLog(@"%lu",data.length);
        self.ZhaoPian.image = [UIImage imageWithData:data];
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
 
}

- (IBAction)BaoCunZhaoPian:(UIButton *)sender
{
      self.SheZhiZhaoPianBeiJing.hidden = YES;
}


//保存文本
-(void)WanCheng
{
    RiJiWenZhang* RJwenzhang = [[RiJiWenZhang alloc]init];
    RJwenzhang.WenBen = self.textView.text;
    RJwenzhang.ShiJian = self.navigationItem.title;
    RJwenzhang.Color = self.textView.textColor;
    NSString* str = [self.AiQingXianShi.text stringByReplacingOccurrencesOfString:@"%" withString:@""];
    RJwenzhang.AiQing = [str doubleValue]/100;
    RJwenzhang.XinQing = self.XINGQINGZHISHU/100*1.0;
    RJwenzhang.ZITIDAXIAO = self.ZITIDAXIAO;
    RJwenzhang.TianQi = self.TianQIXianShi.text;
    RJwenzhang.image = self.ZhaoPian.image;
    self.rjb(RJwenzhang);
    [self.navigationController popViewControllerAnimated:YES];
}
//图片压缩
- (NSData *)resetSizeOfImageData:(UIImage *)source_image maxSize:(NSInteger)maxSize
{
    //先调整分辨率
    CGSize newSize = CGSizeMake(source_image.size.width, source_image.size.height);
    
    CGFloat tempHeight = newSize.height / 1024;
    CGFloat tempWidth = newSize.width / 1024;
    
    if (tempWidth > 1.0 && tempWidth > tempHeight) {
        newSize = CGSizeMake(source_image.size.width / tempWidth, source_image.size.height / tempWidth);
    }
    else if (tempHeight > 1.0 && tempWidth < tempHeight){
        newSize = CGSizeMake(source_image.size.width / tempHeight, source_image.size.height / tempHeight);
    }
    
    UIGraphicsBeginImageContext(newSize);
    [source_image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //调整大小
    NSData *imageData = UIImageJPEGRepresentation(newImage,0.1);
    NSUInteger sizeOrigin = [imageData length];
    NSUInteger sizeOriginKB = sizeOrigin / 1024;
    if (sizeOriginKB > maxSize) {
        NSData *finallImageData = UIImageJPEGRepresentation(newImage,0.05);
        return finallImageData;
    }
    
    return imageData;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}
@end
