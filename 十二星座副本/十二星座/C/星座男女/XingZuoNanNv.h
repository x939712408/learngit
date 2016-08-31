//
//  XingZuoNanNv.h
//  十二星座
//
//  Created by tarena on 16/6/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    _nan,
    _nv
}XinBieQuFen;
@interface XingZuoNanNv : UIViewController
/*星座Tag值*/
@property(nonatomic,assign) NSInteger i;
/* 男/女 */
@property(nonatomic,assign,) XinBieQuFen xb;
/*星座*/
@property(nonatomic,assign) NSString* xzm;
@end
