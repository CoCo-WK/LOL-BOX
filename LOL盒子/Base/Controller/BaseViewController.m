//
//  BaseViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseView.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 创建BaseView对象
    self.baseView = [[BaseView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.baseView.backButton addTarget:self action:@selector(doTapBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.baseView];
}

//  实现返回按钮的方法
- (void)doTapBackButton:(UIButton *)backButton {
    
    [self.navigationController popViewControllerAnimated:YES];
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
