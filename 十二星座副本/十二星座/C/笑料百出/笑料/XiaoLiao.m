//
//  XiaoLiao.m
//  十二星座
//
//  Created by tarena on 16/6/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XiaoLiao.h"
#import "UIImageView+WebCache.h"
@implementation XiaoLiao
// [cell.DongTaiTu sd_setImageWithURL:xlbc.url];
-(void)setXhbcm:(XiaoHuaBaiChuM *)xhbcm
{
    _xhbcm = xhbcm;
   [self.DongTaiTu sd_setImageWithURL:xhbcm.url];
}
- (void)awakeFromNib {
        NSLog(@"%@",self);
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
