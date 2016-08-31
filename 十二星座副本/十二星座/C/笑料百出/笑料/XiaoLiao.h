//
//  XiaoLiao.h
//  十二星座
//
//  Created by tarena on 16/6/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XiaoHuaBaiChuM.h"
@interface XiaoLiao : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *DongTaiTu;
@property (weak, nonatomic) IBOutlet UILabel *NeiRong;
@property(nonatomic,strong) XiaoHuaBaiChuM* xhbcm;
@end
