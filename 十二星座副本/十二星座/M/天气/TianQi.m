//
//  TianQi.m
//  十二星座
//
//  Created by tarena on 16/7/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TianQi.h"

@implementation TianQi
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.city_name = dic[@"realtime"][@"city_name"];
        self.date = dic[@"realtime"][@"date"];
        self.time = dic[@"realtime"][@"time"];
        self.info = dic[@"realtime"][@"weather"][@"info"];
        self.temperature = dic[@"realtime"][@"weather"][@"temperature"];
        self.humidity = dic[@"realtime"][@"weather"][@"humidity"];
    }
    return self;
}
@end
