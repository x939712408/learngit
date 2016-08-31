//
//  RiJiBiao.h
//  十二星座
//
//  Created by tarena on 16/6/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RiJiWenZhang.h"
@interface RiJiBiao : UITableViewCell
@property(nonatomic,strong)RiJiWenZhang* wenzhang;
@property (weak, nonatomic) IBOutlet UIImageView *ZhaoPian;
@property (weak, nonatomic) IBOutlet UILabel *RiQi;
@property (weak, nonatomic) IBOutlet UILabel *WenZhang;
@property (weak, nonatomic) IBOutlet UIView *XingBeiJing;
@property (weak, nonatomic) IBOutlet UIView *AiQingXing;
@property (weak, nonatomic) IBOutlet UIView *XingQingZhiShu;
@property (weak, nonatomic) IBOutlet UIView *XinQingBeiJing;
@property (weak, nonatomic) IBOutlet UILabel *TianQI;
@property (weak, nonatomic) IBOutlet UIImageView *XIngQiZiDongBuJu;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *AiQingZiDongBuJu;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *ZiTiZiDongBuJu;
@property(nonatomic,strong)NSMutableArray* ary;

@end
