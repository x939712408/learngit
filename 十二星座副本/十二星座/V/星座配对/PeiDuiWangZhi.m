//
//  PeiDuiWangZhi.m
//  十二星座
//
//  Created by tarena on 16/6/29.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PeiDuiWangZhi.h"

@interface PeiDuiWangZhi ()
@property (weak, nonatomic) IBOutlet UIWebView *WangZhi;

@end

@implementation PeiDuiWangZhi

- (void)viewDidLoad {
    [super viewDidLoad];
    //@"https://www.baidu.com/ssid=9935ece1bbf0d6aecee8d8bc6561/from=844b/s?word=%E7%99%BD%E7%BE%8A%E5%BA%A7%E5%92%8C%E5%A4%A9%E8%9D%8E%E5%BA%A7&ts=8708135&t_kt=0&ie=utf-8&rsv_iqid=14307591601050670059&rsv_t=f710o8hpBKBgv43F21ItGCm9LnwZrF%252FFO%252F6ziImK%252BH%252BKilStcz%252B110ovVw&sa=ihr_1&ms=1&rsv_pq=14307591601050670059&rsv_sug4=2192&ss=001"
    NSString *path = [NSString stringWithFormat:@"https://www.baidu.com/ssid=9935ece1bbf0d6aecee8d8bc6561/from=844b/s?word=%@和%@&ts=8708135&t_kt=0&ie=utf-8&rsv_iqid=14307591601050670059&rsv_t=f710o8hpBKBgv43F21ItGCm9LnwZrF%%252FFO%%252F6ziImK%%252BH%%252BKilStcz%%252B110ovVw&sa=ihr_1&ms=1&rsv_pq=14307591601050670059&rsv_sug4=2192&ss=001",self.bntxingzuo,self.zhuanpanxingzuo];
    NSLog(@"%@ ---- %@",self.bntxingzuo,self.zhuanpanxingzuo);
    path = [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:path]];
        [self.WangZhi loadRequest:request];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
