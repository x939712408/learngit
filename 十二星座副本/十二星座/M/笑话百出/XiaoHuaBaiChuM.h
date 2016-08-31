//
//  XiaoHuaBaiChuM.h
//  十二星座
//
//  Created by tarena on 16/6/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//
#import "JSONModel.h"
#import <Foundation/Foundation.h>

@interface XiaoHuaBaiChuM : JSONModel
/*
 "content": "谁动了我的冰箱！",
 "hashId": "DDE51B6C09E1557D6542627755901308",
 "unixtime": 1418967626,
 "updatetime": "2014-12-19 13:40:26",
 "url": "http://img.juhe.cn/joke/201412/19/DDE51B6C09E1557D6542627755901308.gif"
 */
@property(nonatomic,strong)NSString* content;
@property(nonatomic,strong)NSURL* url;
@end
