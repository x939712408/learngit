//
//  XMGMainViewController.m
//  十二星座
//
//  Created by tarena on 16/6/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//
#import "XiuGaiMiMa.h"
#import "XMGMainViewController.h"
#import "MainTabbarController.h"
#import "XingZuoChaKan.h"
#import "MyNabigationController.h"
#import "RiJiWenZhang.h"
#import "ShouShiSuo.h"
#import "RiJiBen.h"
#import "AFNetworking.h"
#import "MBProgressHUD+KR.h"
@interface XMGMainViewController ()<UITableViewDataSource,UITableViewDelegate,NSURLSessionDownloadDelegate>
@property (weak, nonatomic) IBOutlet UITableView *Tabelview;
@property (weak, nonatomic) IBOutlet UIButton *HuanTouXiang;
@property (weak, nonatomic) IBOutlet UIImageView *BeiJingXingZuo;
@property (weak, nonatomic) IBOutlet UIView *HuiLaiView;
@property (strong, nonatomic) IBOutlet UITableViewCell *ShouShiCell;
@property (weak, nonatomic) IBOutlet UIView *XuanXingZuoLan;
@property (weak, nonatomic) IBOutlet UIButton *XuanXingZuo;
@property (strong,nonatomic) XMGMainViewController* XMG;
@property (strong, nonatomic) IBOutlet UITableViewCell *RiJiShuJuShangChuan;
@property (strong, nonatomic) MainTabbarController* mytabbar;
@property (strong, nonatomic) IBOutlet UITableViewCell *GeRenSheZhiCell;
@property(nonatomic,strong) MBProgressHUD *hud;
@property(nonatomic,assign) NSInteger i;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *XingZuoTouXiangXuanZe1;



@end
static XMGMainViewController *_xmg;
@implementation XMGMainViewController
+(XMGMainViewController *)sharePlayingXMG
{
    @synchronized(self) {
        if (!_xmg) {

            _xmg = [[XMGMainViewController alloc]init];
        }
    }
    
    return _xmg;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.XuanXingZuoLan.layer.masksToBounds  =YES;
    // Do any additional setup after loading the view.
    
    // 创建tableView控制器（A）
    [self setUpChildView];
    self.mytabbar = [[MainTabbarController alloc] init];
    //MyNabigationController* xzckdh = self.mytabbar.childViewControllers[0];
    self.mytabbar.view.frame = [UIScreen mainScreen].bounds;
    
    // A成为B控制器的子控制器
    [self addChildViewController:self.mytabbar];
    
    // 主视图展示tableView
    [self.mainV addSubview:self.mytabbar.view];
    self.Tabelview.backgroundColor = [UIColor clearColor];
    self.Tabelview.separatorStyle = 0;
    [self.HuanTouXiang setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"ztx%.2lu",self.TouXiangShu]] forState:0];
    self.BeiJingXingZuo.image =[UIImage imageNamed:[NSString stringWithFormat:@"but%.2lu",self.TouXiangShu]];
    //自动布局算法
    for (UIButton* but in self.XingZuoTouXiangXuanZe1) {
        but.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/375*but.frame.origin.x, [UIScreen mainScreen].bounds.size.height/667*but.frame.origin.y, [UIScreen mainScreen].bounds.size.width/375*but.frame.size.width, [UIScreen mainScreen].bounds.size.height/667*but.frame.size.height);
    }
    NSString *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/touxiang.jpg"];
    //把文件数据加载进来
    NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
    //解析图片
    UIImage* image = [NSKeyedUnarchiver unarchiveObjectWithData:imageData];
    [self.XuanXingZuo setBackgroundImage:image forState:0];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger i = [[defaults objectForKey:@"gerenshezhibeijing"] integerValue];

    self.BeiJingXingZuo.image =[UIImage imageNamed:[NSString stringWithFormat:@"but%.2lu",i]];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.but.hidden = YES;
}

//界面移动
-(void)YiDongJieMian
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:NO] forKey:@"panduan"];
    [UIView animateWithDuration:0.5 animations:^{
        _mainV.frame = CGRectMake(self.view.frame.size.width-65, 0, _mainV.frame.size.width, _mainV.frame.size.height);
        self.biandong = YES;
    }completion:^(BOOL finished) {
        [self.view addSubview:self.HuiLaiView];
        
    }];
    
}

//界面回来
-(void)HuiQuJieMian
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:YES] forKey:@"panduan"];
    [UIView animateWithDuration:0.5 animations:^{
        _mainV.frame = CGRectMake(0, 0, _mainV.frame.size.width, _mainV.frame.size.height);
        self.biandong = NO;
    }completion:^(BOOL finished) {
        [self.view sendSubviewToBack:self.HuiLaiView];
        MyNabigationController* rjbdh = self.mytabbar.childViewControllers[3];
        NSLog(@"%@",self.mytabbar.childViewControllers[3]);
        RiJiBen* rjb = rjbdh.viewControllers.lastObject;
         NSLog(@"%@",rjbdh.viewControllers.lastObject);
        NSData *riji = [NSData dataWithContentsOfFile:[self YongHuDiZhi]];
        //解析日记
        rjb.RiJis = [NSKeyedUnarchiver unarchiveObjectWithData:riji];
        [rjb.tableview reloadData];

    }];
}
- (void)setUpChildView
{

    UIView *mainV = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    [self.view addSubview:mainV];
    
    _mainV = mainV;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    cell.backgroundColor = [UIColor clearColor];
    switch (indexPath.row) {
        case 0:
            self.ShouShiCell.backgroundColor =[UIColor clearColor];
            return self.ShouShiCell;
            break;
        case 1:
            self.GeRenSheZhiCell.backgroundColor = [UIColor clearColor];
            return self.GeRenSheZhiCell;
            break;
        case 2:
            self.RiJiShuJuShangChuan.backgroundColor = [UIColor clearColor];
            return self.RiJiShuJuShangChuan;
            break;
        default:
            break;
    }
    return cell;
}


//選擇要求
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([BmobUser getCurrentUser] == nil)
    {
        [MBProgressHUD showError:@"部分功能必须登录后使用"];
        return;
    }
   
    switch (indexPath.row) {
        case 0:
        {
            ShouShiSuo* sss = [[ShouShiSuo alloc]init];
            UINavigationController* navi = [[UINavigationController alloc]initWithRootViewController:sss];
            [self presentViewController:navi animated:YES completion:nil];
        }
            break;
        case 1:
        {
    
             XiuGaiMiMa* xgmm = [[XiuGaiMiMa alloc]init];
            UINavigationController* navi = [[UINavigationController alloc]initWithRootViewController:xgmm];
            [self presentViewController:navi animated:YES completion:nil];
        }
            break;
        case 2:
        {
       
            UIAlertController* aler = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否上传或下载日记数据库" preferredStyle:0];
            UIAlertAction* act = [UIAlertAction actionWithTitle:@"上传数据" style:0 handler:^(UIAlertAction * _Nonnull action) {
                [self ShangChuanShuJu];
            }];
            UIAlertAction* act1 = [UIAlertAction actionWithTitle:@"下载数据" style:0 handler:^(UIAlertAction * _Nonnull action) {
                [self XiaZaiShuJu];
            }];
            UIAlertAction* act2 = [UIAlertAction actionWithTitle:@"取消" style:2 handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [aler addAction:act];
            [aler addAction:act1];
            [aler addAction:act2];
            [self presentViewController:aler animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
}
- (IBAction)HuiJiaChuxianBut:(UITapGestureRecognizer *)sender
{
    self.but.hidden = NO;
    [self HuiQuJieMian];
}
//退出账号
- (IBAction)TuiChu:(UIButton *)sender {
    UIStoryboard *loginStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //修改window 的 rootViewController
    self.view.window.rootViewController = loginStoryboard.instantiateInitialViewController;
    _xmg = nil;
    getUser.noBegin = NO;
    [getUser saveBegin];
    [BmobUser logout];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
//开启头像星族选择
- (IBAction)KaiQiXuanXingZuo:(UIButton *)sender
{
    self.i++;
    if (self.i%2) {
        [UIView animateWithDuration:0.5 animations:^{
        self.XuanXingZuoLan.frame = CGRectMake(self.XuanXingZuoLan.frame.origin.x, self.XuanXingZuoLan.frame.origin.y,[UIScreen mainScreen].bounds.size.width/375*35*6, self.XuanXingZuoLan.frame.size.height);
        }];
    }else
        {
            [UIView animateWithDuration:0.5 animations:^{
                self.XuanXingZuoLan.frame = CGRectMake(self.XuanXingZuoLan.frame.origin.x, self.XuanXingZuoLan.frame.origin.y,0, self.XuanXingZuoLan.frame.size.height);
            }];
        }
}
//选择头像
- (IBAction)XingzuoTouXiang:(UIButton *)sender
{
    self.i++;
    NSString *newImagePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/touxiang.jpg"];
    //解析图片
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:sender.currentBackgroundImage];
    //保存到路径
    [data writeToFile:newImagePath atomically:YES];
       [self.HuanTouXiang setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"ztx%.2lu",sender.tag]] forState:0];
    [UIView animateWithDuration:0.5 animations:^{
        self.XuanXingZuoLan.frame = CGRectMake(self.XuanXingZuoLan.frame.origin.x, self.XuanXingZuoLan.frame.origin.y,0, self.XuanXingZuoLan.frame.size.height);
    }];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithInteger:sender.tag] forKey:@"gerenshezhibeijing"];
    [self.but setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"ztx%.2lu",sender.tag]] forState:0];
    
    self.BeiJingXingZuo.image =[UIImage imageNamed:[NSString stringWithFormat:@"but%.2lu",sender.tag]];
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 38;
}

//获取本地文件上传数据
-(void)ShangChuanShuJu
{

    //本地用户
    BmobUser *bUser = [BmobUser getCurrentUser];

    //获取用户之前的文件地址
    NSString* str = [bUser objectForKey:@"rijiwangzhi"];
    if (str != nil) {
        NSArray *array = @[str];
        //将其删除
        [BmobFile filesDeleteBatchWithArray:array resultBlock:^(NSArray *array, BOOL isSuccessful, NSError *error) {
        }];
    }

    //给入新的日记文本
    NSString *fileString = [self YongHuDiZhi];
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeAnnularDeterminate;
    self.hud.labelText = @"Loading。。。";
    BmobFile *file1 = [[BmobFile alloc] initWithFilePath:fileString];
    [file1 saveInBackground:^(BOOL isSuccessful, NSError *error) {
        //如果文件保存成功，则把文件添加到filetype列
        if (isSuccessful) {
            //打印file文件的url地址
            [bUser setObject:file1.url forKey:@"rijiwangzhi"];
            [bUser updateInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
            NSLog(@"error %@",[error description]);
            }];
            NSLog(@"file1 url %@",file1.url);
            UIAlertController* aler = [UIAlertController alertControllerWithTitle:@"提示" message:@"上传数据成功" preferredStyle:1];
            UIAlertAction* act = [UIAlertAction actionWithTitle:@"确定" style:1 handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [aler addAction:act];
            
            [self presentViewController:aler animated:YES completion:nil];
            
        }else{
          
            UIAlertController* aler = [UIAlertController alertControllerWithTitle:@"提示" message:@"上传数据失败" preferredStyle:1];
            UIAlertAction* act = [UIAlertAction actionWithTitle:@"确定" style:1 handler:^(UIAlertAction * _Nonnull action) {
              
            }];
            [aler addAction:act];
            [self presentViewController:aler animated:YES completion:nil];
            
        }
        [_hud hide:YES];
    }withProgressBlock:^(CGFloat progress) {
        NSLog(@"上传进度%.2f",progress);
            _hud.progress = progress;
        if (progress == 1) {
            [_hud hide:YES];
        }
    }];

}
//获取网路数据到本地
-(void)XiaZaiShuJu
{

    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeAnnularDeterminate;
    self.hud.labelText = @"Loading。。。";
    BmobUser *bUser = [BmobUser getCurrentUser];
    BmobFile *file = (BmobFile*)[bUser objectForKey:@"rijiwangzhi"];
    NSLog(@"%@",file);
    NSString *path =[NSString stringWithFormat:@"%@",file];
    if (file == nil) {
        UIAlertController* aler = [UIAlertController alertControllerWithTitle:@"提示" message:@"数据下载失败" preferredStyle:1];
        UIAlertAction* act = [UIAlertAction actionWithTitle:@"确定" style:1 handler:^(UIAlertAction * _Nonnull action) {
        }];
        [aler addAction:act];
        [self presentViewController:aler animated:YES completion:nil];
        [self.hud hide:YES];
    }
    [self JianCeWangLuo];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:path]];
    //创建一个会话配置对象
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    //创建会话对象
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request];
    
    [task resume];
}
//下载过程方法
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    self.hud.progress = totalBytesWritten*1.0/totalBytesExpectedToWrite;
}
//已经下载完成
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location{
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)downloadTask.response;
//    NSLog(@"服务器返回数据里面所有的头数据：%@",response.allHeaderFields);
    
    NSLog(@"文件名：%@",response.suggestedFilename);

    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:[self YongHuDiZhi]]) {
        [fm removeItemAtPath:[self YongHuDiZhi] error:nil];
        [fm moveItemAtURL:location toURL:[NSURL fileURLWithPath:[self YongHuDiZhi]] error:nil];
    }
    else
    {
        [fm moveItemAtURL:location toURL:[NSURL fileURLWithPath:[self YongHuDiZhi]] error:nil];
    }
    UIAlertController* aler = [UIAlertController alertControllerWithTitle:@"提示" message:@"数据下载成功" preferredStyle:1];
    UIAlertAction* act = [UIAlertAction actionWithTitle:@"确定" style:1 handler:^(UIAlertAction * _Nonnull action) {
    }];
    [aler addAction:act];
    [self presentViewController:aler animated:YES completion:nil];
    [self.hud hide:YES];
}

-(NSString*)YongHuDiZhi
{
    BmobUser *bUser = [BmobUser getCurrentUser];
    //@"Documents/RiJiBens.arch"
    NSString* str = [NSString stringWithFormat:@"Documents/%@RiJiBens.arch",bUser.username];
    NSString *newImagePath = [NSHomeDirectory() stringByAppendingPathComponent:str];
    NSLog(@"%@",newImagePath);
    return newImagePath;
}
//检测网络
-(void)JianCeWangLuo
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch ((int)status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络");
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
            {
                UIAlertController* aler = [UIAlertController alertControllerWithTitle:@"提示" message:@"数据下载失败" preferredStyle:1];
                UIAlertAction* act = [UIAlertAction actionWithTitle:@"确定" style:1 handler:^(UIAlertAction * _Nonnull action) {
                }];
                [aler addAction:act];
                [self presentViewController:aler animated:YES completion:nil];
                [self.hud hide:YES];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"2/3/4g 移动网络");
           
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"wifi");
           
                break;
        }
        
        
        
    }];
    //开始检测
    [manager startMonitoring];

}
-(void)dealloc
{
    NSLog(@"双屏界面被释放");
}
@end
