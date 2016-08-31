//
//  XIngZuoweek.m
//  十二星座
//
//  Created by kiss-minmin on 16/6/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XIngZuoweek.h"

@implementation XIngZuoweek
- (instancetype)initWithZiDian:(NSDictionary*)obj;
{
    self = [super init];
    if (self) {
            self.date = obj[@"date"];
            self.name = obj[@"name"];
            self.health = obj[@"health"];
            self.love = obj[@"love"];
            self.money = obj[@"money"];
            self.work = obj[@"work"];
            self.job = obj[@"job"];
            self.weekth = obj[@"weekth"];
    }
    return self;
}
@end
