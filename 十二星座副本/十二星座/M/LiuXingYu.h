//
//  LiuXingYu.h
//  十二星座
//
//  Created by tarena on 16/6/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiuXingYu : UIImageView
@property (nonatomic)CGRect oldFrame;
@property (nonatomic)float speed;
-(instancetype)initWithI:(int)i;
@end
