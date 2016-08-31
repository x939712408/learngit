//
//  UIButton+ButtonYangShi.m
//  十二星座
//
//  Created by tarena on 16/6/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "UIButton+ButtonYangShi.h"

@implementation UIButton (ButtonYangShi)
-(void)setRoundRectWithRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth andColor:(UIColor *)color {
    //允许对边进行切割
    self.layer.masksToBounds = YES;
    //设置 圆角半径
    self.layer.cornerRadius = radius;
    //设置 圆角的宽度
    self.layer.borderWidth = borderWidth;
    //设置 圆角的颜色
    self.layer.borderColor = color.CGColor;
}


-(void)setRectWithBorderWidth:(CGFloat)borderWidth andColor:(UIColor*)color {
    [self setRoundRectWithRadius:self.frame.size.width * 0.5 borderWidth:borderWidth andColor:color];
}
@end
