//
//  TianQi.h
//  十二星座
//
//  Created by tarena on 16/7/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface TianQi : JSONModel
@property(nonatomic,strong) NSString* city_name;
@property(nonatomic,strong) NSString* date;
@property(nonatomic,strong) NSString* time;
@property(nonatomic,strong) NSString* temperature;
@property(nonatomic,strong) NSString* humidity;
@property(nonatomic,strong) NSString* info;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
