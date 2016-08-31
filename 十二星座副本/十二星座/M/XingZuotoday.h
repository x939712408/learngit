//
//  XingZuotoday.h
//  十二星座
//
//  Created by kiss-minmin on 16/6/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XingZuotoday : NSObject
/*
 "date":20160618,
"name":"狮子座",
"QFriend":"狮子座",
"all":"40%",
"color":"白色",
"datetime":"2016年06月18日",
"health":"80%",
"love":"60%",
"money":"60%",
"number":6,
"summary":"这个周末你是相当忙碌，好不容易才忙完一段家事，终于可以出去晒晒太阳了。一直忙这忙那的，现在可以和恋人好好约会一场，或是做点自己感兴趣的事吧。",
"work":"40%",
"resultcode":"200",
"error_code":0
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
