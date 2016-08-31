//
//  XIAOLIAOBAICHU.m
//  十二星座
//
//  Created by tarena on 16/6/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XIAOLIAOBAICHU.h"
#import "XingZuoUtils.h"
#import "XiaoLiao.h"
#import "XiaoHuaBaiChuM.h"
#import "PhotoBroswerVC.h"
#import "UIImageView+WebCache.h"
@interface XIAOLIAOBAICHU ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *Tablview;
@property(nonatomic,strong)NSMutableArray* XiaoLiaoS;
@end

@implementation XIAOLIAOBAICHU

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.Tablview registerNib:[UINib nibWithNibName:@"XiaoLiao" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"xiaoliao"];

    [XingZuoUtils requestTokenWithCallback:^(id obj) {
        self.XiaoLiaoS = [obj copy];
        [self.Tablview reloadData];
    }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.XiaoLiaoS.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XiaoLiao *cell = [tableView dequeueReusableCellWithIdentifier:@"xiaoliao" forIndexPath:indexPath];
    
   XiaoHuaBaiChuM* xlbc  = self.XiaoLiaoS[indexPath.row];
//    cell.DongTaiTu.contentMode = UIViewContentModeScaleAspectFill;
    cell.xhbcm = xlbc;
    //超出范围不显示
//    cell.clipsToBounds = YES;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 248;
}

@end
