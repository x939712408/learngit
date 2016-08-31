//
//  XingZuoUtils.h
//  十二星座
//
//  Created by kiss-minmin on 16/6/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^MyCallback)(id obj);
@interface XingZuoUtils : NSObject
/*星座运势*/
+(void)requestTokenWithName:(NSString *)name andZhongLei:(NSString*)zhonglei andCallback:(MyCallback)callback;
+(void)requestTokenWithRiQi:(NSString*)riqi andCallback:(MyCallback)callback;
+(void)requestTokenWithCallback:(MyCallback)callback;
+(void)requestTokenWithZhongLei:(NSString*)zhonglei Callback:(MyCallback)callback;
+(void)requestTokenWithTianQiDiZhi:(NSString*)TianQiDiZhi Callback:(MyCallback)callback;
@end
