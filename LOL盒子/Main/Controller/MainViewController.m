//
//  MainViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import "HeroViewController.h"
#import "EquipViewController.h"
#import "InformationViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) MainView *mainView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    
    // 写在这里返回界面时，动画不会执行
    /*
    // 创建MainView对象 并设置button方法
    _mainView = [[MainView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.view addSubview:_mainView];
     */
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    if (_mainView) {
        [_mainView removeFromSuperview];
    }
    // 创建MainView对象 并设置button方法
    _mainView = [[MainView alloc] initWithFrame:[UIScreen mainScreen].bounds];

    [_mainView.heroButton addTarget:self action:@selector(doTapHeroButton:) forControlEvents:UIControlEventTouchUpInside];
    [_mainView.equipmentButton addTarget:self action:@selector(doTapEquipmentButton:) forControlEvents:UIControlEventTouchUpInside];
    [_mainView.informationButton addTarget:self action:@selector(doTapInformationButton:) forControlEvents:UIControlEventTouchUpInside];
    // 添加到父视图上
    [self.view addSubview:_mainView];
}

//  实现heroButton方法
- (void)doTapHeroButton:(UIButton *)heroButton {
    
    [self.navigationController pushViewController:[[HeroViewController alloc] init] animated:YES];
}

//  实现equipmentButton方法
- (void)doTapEquipmentButton:(UIButton *)equipmentButton {

    EquipViewController *equipVC = [[EquipViewController alloc] init];
    [self.navigationController pushViewController:equipVC animated:YES];
}

//  实现informationButton方法
- (void)doTapInformationButton:(UIButton *)informationButton {
    
    InformationViewController *informationVC = [[InformationViewController alloc] init];
    [self.navigationController pushViewController:informationVC animated:YES];
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
