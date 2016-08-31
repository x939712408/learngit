//
//  RiJiWenZhang.h
//  十二星座
//
//  Created by tarena on 16/6/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
@interface RiJiWenZhang : NSObject <NSCoding>
@property (nonatomic,strong) NSString *WenBen;
@property (nonatomic,strong) NSString *TianQi;
@property (nonatomic,strong) NSString *ShiJian;
@property (nonatomic,strong) UIColor* Color;
@property(nonatomic,assign) double AiQing;
@property(nonatomic,assign) double XinQing;
@property(nonatomic,assign) double ZITIDAXIAO;
@property(nonatomic,strong)UIImage* image;
@end
