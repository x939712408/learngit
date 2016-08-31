//
//  User.h
//  Demo3_故事板_新闻
//
//  Created by tarena on 16/5/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

#define getUser [User sharedUser]

@interface User : NSObject

//不是第一次进入为YES，  是第一次进入为NO
@property(nonatomic,assign,getter=isNoBegin)BOOL noBegin;


//工厂方法 获取用户对象  看见shared基本上这个都是单例模式的类
+(instancetype)sharedUser;


-(void)saveBegin;
-(void)loadBegin;


@end










