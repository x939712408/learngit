//
//  XingZuoyear.m
//  十二星座
//
//  Created by kiss-minmin on 16/6/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XingZuoyear.h"
@implementation XingZuoyear
- (instancetype)initWithZiDian:(NSDictionary*)obj;
{
    self = [super init];
    if (self) {
            self.date = obj[@"date"];
            self.name = obj[@"name"];
            self.health = ((NSArray*)obj[@"health"])[0];
            self.love = ((NSArray*)obj[@"love"])[0];
            self.info = obj[@"mima"][@"info"];
            self.text =((NSArray*)obj[@"mima"][@"text"])[0];
            self.luckyStone = obj[@"luckyStone"];
            self.finance = obj[@"finance"][0];
            self.career = obj[@"career"][0];
            self.year = obj[@"year"];

    }
    return self;
}
@end
