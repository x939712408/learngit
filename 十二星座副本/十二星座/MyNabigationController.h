//
//  MyNabigationController.h
//  Demo3_故事板_新闻
//
//  Created by tarena on 16/5/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNabigationController : UINavigationController
@property(nonatomic,strong)UIImage* touxiang;
@property(nonatomic,assign)NSInteger TouXiangShu;
@property(nonatomic,assign,getter=_Panduan)BOOL panduan;
@end
