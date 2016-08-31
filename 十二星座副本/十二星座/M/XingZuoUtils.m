//
//  XingZuoUtils.m
//  十二星座
//
//  Created by kiss-minmin on 16/6/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XingZuoUtils.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "JSONModel.h"
#import "HuangLIM.h"
#import "XiaoHuaBaiChuM.h"
#import "ZhouGongJieMengM.h"
@implementation XingZuoUtils
+(void)requestTokenWithName:(NSString *)name andZhongLei:(NSString*)zhonglei andCallback:(MyCallback)callback{
    // AppKey：72576e052444bc5f248472297c621dc4
    //today,tomorrow,week,nextweek,month,year
    NSString *path = @"http://web.juhe.cn:8080/constellation/getAll";
    NSDictionary *params = @{@"key":@"72576e052444bc5f248472297c621dc4",@"consName":name,@"type":zhonglei};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//                NSString *jsonStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//           NSLog(@"%@",jsonStr);
        callback(dic);
//
//        NSLog(@"请求成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"请求失败：%@",error);
    }];

}

+(void)requestTokenWithRiQi:(NSString*)riqi andCallback:(MyCallback)callback
{
    // AppKey：5370fafc5aa3de387fcc547a0962c256
    //http://v.juhe.cn/laohuangli/d
    NSString *path = @"http://v.juhe.cn/laohuangli/d";
    NSDictionary *params = @{@"key":@"5370fafc5aa3de387fcc547a0962c256",@"date":riqi};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        NSString *jsonStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//        NSLog(@"%@",jsonStr);
//        //result
        NSDictionary* dic1 = dic[@"result"];
          HuangLIM *HLM = [[HuangLIM alloc]initWithDictionary:dic1 error:nil];
        callback(HLM);
        //
                NSLog(@"请求成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"请求失败：%@",error);
    }];
}
//AppKey：ce0b169e5d77a28272e8554fe59c7690
+(void)requestTokenWithCallback:(MyCallback)callback
{
    //AppKey：ce0b169e5d77a28272e8554fe59c7690
    //http://japi.juhe.cn/joke/img/text.from
    NSString *path = @"http://japi.juhe.cn/joke/img/text.from";
    NSDictionary *params = @{@"key":@"ce0b169e5d77a28272e8554fe59c7690",@"pagesize":@20};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//                NSString *jsonStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//                NSLog(@"%@",jsonStr);
                //result
        NSDictionary* dic1 = dic[@"result"];
        NSArray* array = dic1[@"data"];
        NSArray* ary = [XiaoHuaBaiChuM arrayOfModelsFromDictionaries:array error:nil];
        callback(ary);
        //
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败：%@",error);
    }];
}

+(void)requestTokenWithZhongLei:(NSString*)zhonglei Callback:(MyCallback)callback
{
    //AppKey：aaa0ae5b41d7838df85091d3f34e2b6e
    //http://v.juhe.cn/dream/query
    NSString *path = @"http://v.juhe.cn/dream/query";
    NSDictionary *params = @{@"key":@"aaa0ae5b41d7838df85091d3f34e2b6e",@"q":zhonglei};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        NSString *jsonStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//        NSLog(@"%@",jsonStr);
//        //result
        NSArray* array = dic[@"result"];
        NSArray* ary = [ZhouGongJieMengM arrayOfModelsFromDictionaries:array error:nil];
        callback(ary);
        //
//        NSLog(@"%lu",array.count);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败：%@",error);
    }];
}
+(void)requestTokenWithTianQiDiZhi:(NSString*)TianQiDiZhi Callback:(MyCallback)callback
{
    // AppKey：f8e5012a2b206780c661758a1f85190d
    //http://op.juhe.cn/onebox/weather/query
    NSString *path = @"http://op.juhe.cn/onebox/weather/query";
    NSDictionary *params = @{@"key":@"f8e5012a2b206780c661758a1f85190d",@"cityname":TianQiDiZhi};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
                        NSString *jsonStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
                        NSLog(@"%@",jsonStr);
        NSString* str =dic[@"reason"];
        if ([str isEqualToString:@"暂不支持该城市"]) {
            return ;
        }
            callback(dic[@"result"][@"data"]);
     
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
      
    }];

}
@end
