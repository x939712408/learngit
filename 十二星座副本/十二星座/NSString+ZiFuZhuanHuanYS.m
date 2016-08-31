//
//  NSString+ZiFuZhuanHuanYS.m
//  十二星座
//
//  Created by tarena on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "NSString+ZiFuZhuanHuanYS.h"

@implementation NSString (ZiFuZhuanHuanYS)
-(UIColor*)ZFzhuanYS
{
    NSArray* array = [self componentsSeparatedByString:@" "];
    UIColor* color = [UIColor colorWithRed:((NSString*)array[1]).floatValue green:((NSString*)array[2]).floatValue blue:((NSString*)array[3]).floatValue alpha:((NSString*)array[4]).floatValue];
    return color;
}
@end
