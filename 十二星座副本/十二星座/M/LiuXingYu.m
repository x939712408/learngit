//
//  LiuXingYu.m
//  十二星座
//
//  Created by tarena on 16/6/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LiuXingYu.h"

@implementation LiuXingYu

- (instancetype)initWithI:(int)i
{
    self = [super init];
    if (self) {
        self.image = [UIImage imageNamed:@"liuxing"];
        //0.2-1;
        float flag = i/10.0 + 0.1;
        self.speed = flag*2;
        float w = 45+(90*flag);
        float h = 30+(60*flag);
        
        self.frame = CGRectMake(arc4random()%(int)([UIScreen mainScreen].bounds.size.width)-w, arc4random()%(int)[UIScreen mainScreen].bounds.size.height, w, h);
        
    }
     return self;
}

@end
