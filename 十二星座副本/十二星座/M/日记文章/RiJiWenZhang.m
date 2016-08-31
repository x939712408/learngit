
//
//  RiJiWenZhang.m
//  十二星座
//
//  Created by tarena on 16/6/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RiJiWenZhang.h"

@implementation RiJiWenZhang
//时机：归档调用该方法
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    //对所有的属性进行编码操作
    [aCoder encodeObject:self.WenBen forKey:@"WenBen"];
    [aCoder encodeObject:self.TianQi forKey:@"TianQi"];
    [aCoder encodeObject:self.ShiJian forKey:@"ShiJian"];
    [aCoder encodeObject:self.Color forKey:@"Color"];
    [aCoder encodeDouble:self.AiQing forKey:@"AiQing"];
    [aCoder encodeDouble:self.XinQing forKey:@"XinQing"];
    [aCoder encodeDouble:self.ZITIDAXIAO forKey:@"ZITIDAXIAO"];
    [aCoder encodeObject:self.image forKey:@"image"];
}
//时机：解档（解码）调用该方法
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.WenBen = [aDecoder decodeObjectForKey:@"WenBen"];
        self.TianQi  = [aDecoder decodeObjectForKey:@"TianQi"];
        self.ShiJian  = [aDecoder decodeObjectForKey:@"ShiJian"];
        self.Color  = [aDecoder decodeObjectForKey:@"Color"];
        self.AiQing  = [aDecoder decodeDoubleForKey:@"AiQing"];
        self.XinQing  = [aDecoder decodeDoubleForKey:@"XinQing"];
        self.ZITIDAXIAO  = [aDecoder decodeDoubleForKey:@"ZITIDAXIAO"];
        self.image  = [aDecoder decodeObjectForKey:@"image"];
    }
    return  self;
}
@end
