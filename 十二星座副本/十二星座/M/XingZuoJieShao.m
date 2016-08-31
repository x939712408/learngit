//
//  XingZuoJieShao.m
//  十二星座
//
//  Created by kiss-minmin on 16/6/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XingZuoJieShao.h"

@implementation XingZuoJieShao
-(instancetype)initWith
{
    self = [super init];
    if (self)
    {
        NSString* plist = [[NSBundle mainBundle]pathForResource:@"xingzuo" ofType:@"plist"];
        NSArray* xingzuo = [NSArray arrayWithContentsOfFile:plist];
        self.xingzuojieshao = [NSMutableArray array];
        for (NSDictionary* dic in xingzuo)
        {
            XingZuoJieShao* xzjs = [[XingZuoJieShao alloc]init];
            [xzjs setValuesForKeysWithDictionary:dic];
            [self.xingzuojieshao addObject:xzjs];
        }
    
    }
    return self;
}
@end
