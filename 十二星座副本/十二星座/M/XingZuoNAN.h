//
//  XingZuoNAN.h
//  十二星座
//
//  Created by tarena on 16/6/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XingZuoNAN : NSObject
//@"td":@"善良、好脾气",
//@"rd":@"意志薄弱、不现实",
//@"aq":@"不怕被女生拒绝，绝对专一",
//@"ys":@[@"0",@"24",@"53"],
//@"nrjs":@"温柔多情的双鱼座男生，就是一典型的风流才子范。双鱼男充满了浪漫唯美的色彩，在你们的世界里拥有着对爱情美好得如童话般的追求。之于生活，双鱼男却知足常乐，只要得过且过即可。看似文弱不堪一击的双鱼男，面对困难险阻时却能迸发出惊人的不服输精神。只是在抉择面前，却又显得特别黔驴技穷。",
//@"nr":@"双鱼座的男人  温
@property(nonatomic,strong) NSString* td;
@property(nonatomic,strong) NSString* rd;
@property(nonatomic,strong) NSString* aq;
@property(nonatomic,strong) NSArray* ys;
@property(nonatomic,strong) NSString* nrjs;
@property(nonatomic,strong) NSString* nr;
@property (nonatomic,strong) NSMutableArray * xingzuonanS;
-(instancetype)initWith;

@end
