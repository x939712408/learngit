//
//  UIButton+ButtonYangShi.h
//  十二星座
//
//  Created by tarena on 16/6/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ButtonYangShi)

/*把一个Button做成圆角矩形*/
-(void)setRoundRectWithRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth andColor:(UIColor*)color;

/*把个Button做成圆形*/
-(void)setRectWithBorderWidth:(CGFloat)borderWidth andColor:(UIColor*)color;
@end
