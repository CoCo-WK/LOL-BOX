//
//  FightViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "FightViewController.h"
#import "BaseView.h"
#import "UIButton+WebCache.h"

@interface FightViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation FightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7, kViewWidth, kViewHeight / 7 * 6)];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    NSString *str = [NSString stringWithFormat:@"http://zdl.mbox.duowan.com/phone/playerDetailNew.php?sn=%@&target=%@&v=70&OSType=iOS8.1.2&versionName=2.1.4", self.serverName, self.name];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[str stringByAddingPercentEncodingWithAllowedCharacters: [NSCharacterSet URLQueryAllowedCharacterSet]]] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15];
    [self.webView loadRequest:request];
    [self.webView reload];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame = CGRectMake(self.view.bounds.size.width / 5 * 4 + 10, 40, 40, 40);
    self.baseView.topImageView.userInteractionEnabled = YES;
    [cancelButton addTarget:self action:@selector(doTapCancelButton:) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton setBackgroundImage:[UIImage imageNamed:@"login"] forState:UIControlStateNormal];
    [self.view addSubview:cancelButton];
}

- (void)doTapCancelButton:(UIButton *)button {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定注销" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLogin"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:sure];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([self.binding isEqualToString:@"binding"]) {
        [userDefaults setBool:YES forKey:@"isLogin"];
        [userDefaults setObject:self.serverName forKey:@"server"];
        [userDefaults setObject:self.name forKey:@"name"];
        [userDefaults synchronize];
    }
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    
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
