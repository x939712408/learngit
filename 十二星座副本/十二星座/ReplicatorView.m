//
//  ImageView.m
//  05-倒影
//
//  Created by yz on 15/6/20.
//  Copyright (c) 2015年 yz. All rights reserved.
//

#import "ReplicatorView.h"

@implementation ReplicatorView


+ (Class)layerClass
{
    return [CAReplicatorLayer class];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
