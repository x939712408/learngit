
//
//  XingZuoNV.m
//  十二星座
//
//  Created by kiss-minmin on 16/6/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XingZuoNV.h"

@implementation XingZuoNV
-(instancetype)initWith
{
    self = [super init];
    if (self)
    {
        NSString* plist = [[NSBundle mainBundle]pathForResource:@"xingzuonv" ofType:@"plist"];
        NSArray* xingzuonan = [NSArray arrayWithContentsOfFile:plist];
        self.xingzuonvS = [NSMutableArray array];
        for (NSDictionary* dic in xingzuonan)
        {
            XingZuoNV* xzv = [[XingZuoNV alloc]init];
            [xzv setValuesForKeysWithDictionary:dic];
            [self.xingzuonvS addObject:xzv];
        }
        
    }
    return self;
}

@end
