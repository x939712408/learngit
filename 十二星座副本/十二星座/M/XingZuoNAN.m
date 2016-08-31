//
//  XingZuoNAN.m
//  十二星座
//
//  Created by tarena on 16/6/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XingZuoNAN.h"

@implementation XingZuoNAN
-(instancetype)initWith
{
    self = [super init];
    if (self)
    {
        NSString* plist = [[NSBundle mainBundle]pathForResource:@"xingzuonan" ofType:@"plist"];
        NSArray* xingzuonan = [NSArray arrayWithContentsOfFile:plist];
        self.xingzuonanS = [NSMutableArray array];
        for (NSDictionary* dic in xingzuonan)
        {
            XingZuoNAN* xzn = [[XingZuoNAN alloc]init];
            [xzn setValuesForKeysWithDictionary:dic];
            [self.xingzuonanS addObject:xzn];
        }
        
    }
    return self;
}
@end
