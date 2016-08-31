//
//  XingZuomonth.m
//  十二星座
//
//  Created by kiss-minmin on 16/6/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XingZuomonth.h"

@implementation XingZuomonth
- (instancetype)initWithZiDian:(NSDictionary*)obj;
{
    self = [super init];
    if (self) {
      
            self.date = obj[@"date"];
            self.all = obj[@"all"];
            self.health = obj[@"health"];
            self.love = obj[@"love"];
            self.month = obj[@"month"];
            self.money = obj[@"money"];
            self.work = obj[@"work"];
    }
    return self;
}
@end
