//
//  XingZuoJieShao.h
//  十二星座
//
//  Created by kiss-minmin on 16/6/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XingZuoJieShao : NSObject
//@"xz":@"摩羯座",
//@"rq":@"12月22日-1月19日",
//@"sx":@"土",
//@"td":@"执著现实",
//@"zggw":@"第十宫",
//@"yyx":@"阴性",
//@"zdtz":@"实际",
//@"zgx":@"土星",
//@"ys":@"咖啡色、黑、墨绿",
//@"zb":@"黑玉",
//@"xyhm":@"4",
//@"js":@"银",
//@"xg":
@property(nonatomic,strong) NSMutableArray* xingzuojieshao;
@property(nonatomic,strong) NSString* xz;
@property(nonatomic,strong) NSString* rq;
@property(nonatomic,strong) NSString* sx;
@property(nonatomic,strong) NSString* td;
@property(nonatomic,strong) NSString* zggw;
@property(nonatomic,strong) NSString* yyx;
@property(nonatomic,strong) NSString* zdtz;
@property(nonatomic,strong) NSString* zgx;
@property(nonatomic,strong) NSString* ys;
@property(nonatomic,strong) NSString* zb;
@property(nonatomic,strong) NSString* xyhm;
@property(nonatomic,strong) NSString* js;
@property(nonatomic,strong) NSString* xg;
@property(nonatomic,strong) NSArray* sxys;
-(instancetype)initWith;
@end
