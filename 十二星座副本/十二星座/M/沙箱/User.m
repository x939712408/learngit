//
//  User.m
//  Demo3_故事板_新闻
//
//  Created by tarena on 16/5/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "User.h"

//恶汉模式（浪费内存）    懒汉模式（多线程不安全，解决: 使用 GCD 多线程技术，来写单利）
@implementation User

+(instancetype)sharedUser {
    static User *user = nil;
    if (user == nil) {
        user = [[User alloc]init];
    }
    return user;
}

//该方法只要被调用过 再次进入应用肯定不是第一次进入
-(void)saveBegin {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:self.isNoBegin] forKey:@"begin"];
    [defaults synchronize];
}
-(void)loadBegin {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.noBegin = [[defaults objectForKey:@"begin"] boolValue];
}



@end









