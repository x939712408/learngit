//
//  XingZuomonth.h
//  十二星座
//
//  Created by kiss-minmin on 16/6/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XingZuomonth : NSObject
/*
"date":"2016年06月",
 "name":"白羊座","all":"本月对于在校读书的白羊，运气不错，只要用心学，很快就可以上手，成绩见效显著。对于在职的白羊来说，职场学习和交流的机会多，熟悉某项技能很易上手，也可以获得丰富的资讯。另外一个值得关注点，是火星在资源宫的逆行，这意味着一股隐藏着的强大力量，你需要考虑如何驾驭它为其所用，但是如果太贪心，也很容易被它反噬。",
 "health":"水星在沟通宫位，出行要小心交通意外了。下半月，会比较恋家，只要待在家中，身心能量就可以得到补充。整理家居也有收拾心情的作用。\r\n\r\n",
 "love":"上半月，甜蜜的情话是很凑效的，到了下半月，这些就显得多余了，像家人一样的平淡日常反而更令你安心，单身汪会比任何时候都渴望稳定的情感关系。另外，性能量高涨，但是往往受到压制，你在寻求爆破口，深爱也成为一种虐，被你深深压抑。\r\n",
 "money":"上半月，靠一张嘴就可以找来财运，是老天爷赏饭吃的机会，从事销售或中介业的白羊要抓紧时机开单。下半月，家人会给予你财务支援，出行购置或处理房产的时机，投资和生意的话，不熟不做的原则要坚持。",
 "month":6,
 "work":"上旬的关注力分散，耐力不够，对于速战速决的项目，表现佳，至于要打耐力战的，建议放到下旬吧。\r\n",
 */
@property(nonatomic,strong) NSString* date;
@property(nonatomic,strong) NSString* all;
@property(nonatomic,strong) NSString* health;
@property(nonatomic,strong) NSString* love;
@property(nonatomic,strong) NSString* money;
@property(nonatomic,strong) NSString* month;
@property(nonatomic,strong) NSString* work;
- (instancetype)initWithZiDian:(NSDictionary*)obj;
@end
