//
//  XingZuotomorrow.m
//  十二星座
//
//  Created by kiss-minmin on 16/6/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XingZuotomorrow.h"
@implementation XingZuotomorrow
- (instancetype)initWithZiDian:(NSDictionary*)obj;
{
    self = [super init];
    if (self) {
   
            self.date = obj[@"date"];
            self.name = obj[@"name"];
            self.QFriend = obj[@"QFriend"];
            self.all = obj[@"all"];
            self.color = obj[@"color"];
            self.datetime = obj[@"datetime"];
            self.health = obj[@"health"];
            self.love = obj[@"love"];
            self.money = obj[@"money"];
            self.number = obj[@"number"];
            self.summary = obj[@"summary"];
            self.work = obj[@"work"];

    }
    return self;
}
@end
