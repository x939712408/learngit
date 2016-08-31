//
//  RiJi.h
//  十二星座
//
//  Created by tarena on 16/6/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//
#import "RiJiWenZhang.h"
#import <UIKit/UIKit.h>
typedef void(^RIJIBEN)(RiJiWenZhang*);
@interface RiJi : UIViewController
@property (nonatomic,strong) RIJIBEN rjb;
@end
