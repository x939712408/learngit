//
//  XingZuoNV.h
//  十二星座
//
//  Created by kiss-minmin on 16/6/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XingZuoNV : NSObject
@property(nonatomic,strong) NSString* td;
@property(nonatomic,strong) NSString* rd;
@property(nonatomic,strong) NSString* aq;
@property(nonatomic,strong) NSArray* ys;
@property(nonatomic,strong) NSString* nrjs;
@property (nonatomic,strong) NSMutableArray * xingzuonvS;
-(instancetype)initWith;
@end
