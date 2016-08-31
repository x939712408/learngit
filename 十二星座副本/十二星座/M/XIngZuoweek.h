//
//  XIngZuoweek.h
//  十二星座
//
//  Created by kiss-minmin on 16/6/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XIngZuoweek : NSObject
/*
  {"date":"2016年06月12日-2016年06月18日",
 "name":"狮子座",
 "health":"健康：容易感染传染性疾病。和家人的关系，有修补时机，子晴小提醒，逃避，终不是长久之计，下一个周期，心痛的感觉还是会找上你。 作者：马子晴",
 "job":"求职：懂得收敛锋芒比较有利。 ",
 "love":"恋情：和朋友的亲密关系影响到爱情。开始进入暧昧期。狮子的情感界限变得模糊。 ",
 "money":"财运：人气生财的运势到了强弩之末。海王星本周开启在资源宫的逆行，接下来的半年里，之前被利诱上钩的，现在有所醒觉，要珍视这个直觉，深挖下去，看看能否弥补。 ",
 "weekth":25,
 "work":"工作：水星本周入朋友宫，预示你对自己有更好的期待，希望获得更多公众支持，你会主动地站到人群前，以宣讲的姿态。金星周末入心灵宫，预示你获得的公众支持在减少，人际助力转为熟人暗中支持。所以，小结起来，本周在人际上的大动作其实是起到了反作用。 ",
 "resultcode":"200",
 "error_code":0}
 */
@property(nonatomic,strong) NSString* date;
@property(nonatomic,strong) NSString* name;
@property(nonatomic,strong) NSString* health;
@property(nonatomic,strong) NSString* job;
@property(nonatomic,strong) NSString* love;
@property(nonatomic,strong) NSString* money;
@property(nonatomic,strong) NSNumber* weekth;
@property(nonatomic,strong) NSString* work;
- (instancetype)initWithZiDian:(NSDictionary*)obj;
@end
