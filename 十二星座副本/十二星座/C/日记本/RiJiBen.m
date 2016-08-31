//
//  RiJiBen.m
//  十二星座
//
//  Created by tarena on 16/7/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RiJiBen.h"
#import "RiJiBiao.h"
#import "RiJiWenZhang.h"
#import "RiJiXiuGai.h"
#import "RiJi.h"
#import "MBProgressHUD+KR.h"
@interface RiJiBen ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,UISearchControllerDelegate,UIScrollViewDelegate>
@property(nonatomic,strong) MBProgressHUD *hud;
@property(nonatomic,strong)NSString* bianji;
@property (nonatomic, strong)UISearchController *searchController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,assign,getter=_ShouShiPanDuan) BOOL soushipanduan;
@property (nonatomic, strong)NSMutableArray *results;
@end

@implementation RiJiBen

-(NSMutableArray*)RiJis
{
    if (!_RiJis) {
        _RiJis = [NSMutableArray array];
    }
    return _RiJis;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.soushipanduan = NO;
    UIBarButtonItem* but = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(XieRu)];
    UIBarButtonItem*button = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editData:)];
    self.navigationItem.rightBarButtonItems = @[but,button];
    [self.tableView registerNib:[UINib nibWithNibName:@"RiJiBiao" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"riqicell"];
    //去掉tableView的分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIImageView* beijing = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    beijing.image = [UIImage imageNamed:@"107066-120421131S019"];
    self.tableView.backgroundView = beijing;
   // self.tableView.
    self.bianji = @"编辑";
    //把文件数据加载进来
    self.tableview = self.tableView;
    NSData *riji = [NSData dataWithContentsOfFile:[self YongHuDiZhi]];
    //解析日记
    if (riji)
    {
        self.RiJis = [NSKeyedUnarchiver unarchiveObjectWithData:riji];
        
    }
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.searchResultsUpdater = self;
    self.searchController.delegate = self;
    self.searchController.searchBar.placeholder = @"请输入日期进行搜索";
    self.tableView.tableHeaderView = self.searchController.searchBar;
 
}
-(void)XieRu
{
    if ([BmobUser getCurrentUser] == nil)
    {
        [MBProgressHUD showError:@"部分功能必须登录后使用"];
        return;
    }
    RiJi* rj = [[RiJi alloc]init];
    rj.rjb = ^(RiJiWenZhang* wz)
    {
        [self.RiJis addObject:wz];
        //保存日记
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        self.hud.mode = MBProgressHUDModeIndeterminate;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.RiJis];
            [data writeToFile:[self YongHuDiZhi] atomically:YES];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.hud hide:YES];
            });
        });
    };
    if ([self.bianji isEqualToString:@"编辑"]) {
        self.tabBarController.tabBar.hidden=YES;
        [self.navigationController pushViewController:rj animated:YES];
    }
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:YES] forKey:@"panduan"];
    [defaults synchronize];
    self.tabBarController.tabBar.hidden = NO;
    [self.tableView reloadData];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized(self) {
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.RiJis];
            
            [data writeToFile:[self YongHuDiZhi] atomically:YES];
        }
    });
    
}
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString *text = searchController.searchBar.text;
    //如果没有内容就不搜索
    if (!text||text.length==0) {
        [self.tableView reloadData];
        return;
    }

    self.results = [NSMutableArray array];
    for (RiJiWenZhang* wenben in self.RiJis)
    {
        NSRange _rang = [wenben.ShiJian rangeOfString:text];
        if (_rang.location != NSNotFound) {
            [self.results addObject:wenben];
        }
    }
        [self.tableView reloadData];
}
- (void)willPresentSearchController:(UISearchController *)searchController{
    self.tabBarController.tabBar.hidden = YES;
    self.results = nil;
}
- (void)willDismissSearchController:(UISearchController *)searchController
{
    self.tabBarController.tabBar.hidden = NO;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.searchController.isActive) {
        return self.results.count;
    }
    return self.RiJis.count;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.searchController.searchBar resignFirstResponder];
}
//滚动收键盘
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self.searchController.searchBar resignFirstResponder];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RiJiBiao *cell = [tableView dequeueReusableCellWithIdentifier:@"riqicell" forIndexPath:indexPath];
    
    if (self.searchController.isActive) {
        
        cell.wenzhang = self.results[indexPath.row];
        
    }else
    {
    cell.wenzhang = self.RiJis[indexPath.row];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

//点击进入修改日记
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //关闭搜索
    self.searchController.active = NO;
    if (self._ShouShiPanDuan) {
        RiJiXiuGai* xjxg = [[RiJiXiuGai alloc]init];
        xjxg.rjwz = self.RiJis[indexPath.row];
        self.tabBarController.tabBar.hidden=YES;
        [self.navigationController pushViewController:xjxg animated:YES];
    }
    else
    {
        if ([[PCCircleViewConst getGestureWithKey:gestureFinalSaveKey] length])
        {
            GestureVerifyViewController *gestureVerifyVc = [[GestureVerifyViewController alloc] init];
            gestureVerifyVc.shoushipanduan = ^(BOOL panduan)
            {
                self.soushipanduan = panduan;
            };
            self.tabBarController.tabBar.hidden = YES;
            [self.navigationController pushViewController:gestureVerifyVc animated:YES];
        }else
        {
            RiJiXiuGai* xjxg = [[RiJiXiuGai alloc]init];
            xjxg.rjwz = self.RiJis[indexPath.row];
            self.tabBarController.tabBar.hidden=YES;
            [self.navigationController pushViewController:xjxg animated:YES];
        }
        
    }
}
//编辑表式图
-(void)editData:(UIBarButtonItem*)sender {
    //日记长度为0无法编辑
    if (self.RiJis.count == 0 && [self.bianji isEqualToString:@"编辑"]) {
        return;
    }
    //设置 tableView的编辑状态
    //    self.tableView.editing = !self.tableView.editing;
    //设置 tableView的编辑状态 带动画
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    //根据tablevie的编辑状态 修改 导航栏右边按钮的 title
    self.bianji = sender.title = self.tableView.isEditing ? @"完成" : @"编辑";
}
//tableView UITableViewDataSource 中的方法
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    //除了第一行 其它行 都可以编辑
    return YES;
}
//tableView 设置可以编辑的单元格 的 样式  editingStyle
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleDelete;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.searchController.isActive &&editingStyle == UITableViewCellEditingStyleDelete)
    {
        RiJiBiao *cell = [tableView cellForRowAtIndexPath:indexPath];
        [self.RiJis removeObject:cell.wenzhang];
        [self.results removeObject:cell.wenzhang];
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        self.hud.mode = MBProgressHUDModeIndeterminate;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.RiJis];
            [data writeToFile:[self YongHuDiZhi] atomically:YES];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.hud hide:YES];
            });
        });
        [self.tableView reloadData];
        
    }
    else if(editingStyle == UITableViewCellEditingStyleDelete){
        //根据下标 移除数组元素  当前的行号就是要移除的元素的下标
        [self.RiJis removeObjectAtIndex:indexPath.row];
        //从tableView 删除某一行
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        NSLog(@"删除元素");
    }
    if (self.RiJis.count == 0) {
        UIBarButtonItem* item = self.navigationItem.rightBarButtonItems[1];
        self.bianji =item.title =@"编辑";
        self.tableView.editing = NO;
    }
    if (self.tableView.isEditing == NO) {
        //保存日记
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        self.hud.mode = MBProgressHUDModeIndeterminate;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.RiJis];
            [data writeToFile:[self YongHuDiZhi] atomically:YES];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.hud hide:YES];
            });
        });
    }
    
}
-(NSString*)YongHuDiZhi
{
    BmobUser *bUser = [BmobUser getCurrentUser];
    //@"Documents/RiJiBens.arch"
    NSString* str = [NSString stringWithFormat:@"Documents/%@RiJiBens.arch",bUser.username];
    NSString *newImagePath = [NSHomeDirectory() stringByAppendingPathComponent:str];
    return newImagePath;
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
//    //关闭搜索
//    self.searchController.active = NO;

}
@end
