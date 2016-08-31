//
//  XMGMainViewController.h
//  十二星座
//
//  Created by tarena on 16/6/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMGMainViewController : UIViewController

// 设计原理：如果需要把控件暴露出去，一定要要写readonly
@property (nonatomic, weak, readonly) UIView *mainV;
@property (nonatomic, weak, readonly) UIView *leftV;
@property (nonatomic, weak, readonly) UIView *rightV;
/*获取星座名*/
@property(nonatomic,strong) NSArray* xingzuoming;
@property(nonatomic,assign) NSInteger TouXiangShu;
@property(nonatomic,strong) UIButton* but;
@property(nonatomic,assign,getter=_isbiandong)BOOL biandong;
-(void)YiDongJieMian;
-(void)HuiQuJieMian;
+(XMGMainViewController *)sharePlayingXMG;
@end
