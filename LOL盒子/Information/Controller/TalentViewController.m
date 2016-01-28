//
//  TalentViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "TalentViewController.h"

@interface TalentViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation TalentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7, kViewWidth, kViewHeight / 7 * 6)];
    [self.view addSubview:self.webView];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[@"http://llbox.cn/loltfs6/index.htm" stringByAddingPercentEncodingWithAllowedCharacters: [NSCharacterSet URLQueryAllowedCharacterSet]]] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15];
    [self.webView loadRequest:request];
    [self.webView reload];
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
