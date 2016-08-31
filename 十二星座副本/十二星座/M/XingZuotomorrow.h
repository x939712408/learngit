//
//  XingZuotomorrow.h
//  十二星座
//
//  Created by kiss-minmin on 16/6/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XingZuotomorrow : NSObject
/*
 {"date":20160619,
 "name":"狮子座",
 "QFriend":"白羊座",
 "all":"40%",
 "color":"紫色",
 "datetime":
 "2016年06月19日",
 "health":"74%","
 love":"20%",
 "money":"40%",
 "number":9,
 "summary":"今天的你即使向他人表白，或者和恋人约会也容易碰得一鼻子灰，做一些吃力不讨好的事，赔了夫人又折兵。可能你觉得很扫兴，面对他人的邀请感到提不起精神。",
 "work":"40%",
 "resultcode":"200",
 "error_code":0}
 
 */
@property(nonatomic,strong) NSString* date;
@property(nonatomic,strong) NSString* name;
@property(nonatomic,strong) NSString* QFriend;
@property(nonatomic,strong) NSString* all;
@property(nonatomic,strong) NSString* color;
@property(nonatomic,strong) NSString* datetime;
@property(nonatomic,strong) NSString* health;
@property(nonatomic,strong) NSString* love;
@property(nonatomic,strong) NSString* money;
@property(nonatomic,strong) NSNumber* number;
@property(nonatomic,strong) NSString* summary;
@property(nonatomic,strong) NSString* work;
- (instancetype)initWithZiDian:(NSDictionary*)obj;
@end
