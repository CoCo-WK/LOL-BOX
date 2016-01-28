//
//  InformationViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "InformationViewController.h"
#import "UIColor+AddColor.h"
#import "EncyclopediaViewController.h"
#import "LoginViewController.h"
#import "FightViewController.h"
#import "SearchViewController.h"
#import "NovelViewController.h"

@interface InformationViewController ()

@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 战斗力查询按钮
    UIButton *fightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    fightButton.frame = CGRectMake(kViewWidth / 5, kViewWidth / 8 + kViewHeight / 7, kViewWidth / 5, kViewWidth / 5);
    // 为战斗力按钮设置背景
    [fightButton setBackgroundImage:[UIImage imageNamed:@"fight"] forState:UIControlStateNormal];
    // 为战斗力button设置方法
    [fightButton addTarget:self action:@selector(doTapFightButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fightButton];
    
    UILabel *fightLabel = [[UILabel alloc] initWithFrame:CGRectMake(fightButton.frame.origin.x, fightButton.frame.origin.y + fightButton.frame.size.height + 10, fightButton.bounds.size.width, 20)];
    fightLabel.text = @"战斗力";
    fightLabel.textColor = [UIColor carrotColor];
    fightLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:fightLabel];
    
    // 游戏百科查询按钮
    UIButton *informationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    informationButton.frame = CGRectMake(kViewWidth / 5 * 3, kViewWidth / 8 + kViewHeight / 7, kViewWidth / 5, kViewWidth / 5);
    // 为百科按钮设置背景
    [informationButton setBackgroundImage:[UIImage imageNamed:@"data"] forState:UIControlStateNormal];
    // 为百科按钮设置方法
    [informationButton addTarget:self action:@selector(doTapInformationButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:informationButton];
    
    UILabel *informationLabel = [[UILabel alloc] initWithFrame:CGRectMake(informationButton.frame.origin.x, informationButton.frame.origin.y + informationButton.frame.size.height + 10, informationButton.bounds.size.width, 20)];
    informationLabel.text = @"游戏百科";
    informationLabel.textColor = [UIColor carrotColor];
    informationLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:informationLabel];
    
    // 账号查询按钮
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame = CGRectMake(fightButton.frame.origin.x, fightButton.frame.origin.y + fightButton.bounds.size.height + 40, kViewWidth / 5, kViewWidth / 5);
    // 为账号按钮设置背景
    [searchButton setBackgroundImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    // 为账号button设置方法
    [searchButton addTarget:self action:@selector(doTapSearchButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchButton];
    
    UILabel *searchLabel = [[UILabel alloc] initWithFrame:CGRectMake(searchButton.frame.origin.x, searchButton.frame.origin.y + searchButton.frame.size.height + 10, searchButton.bounds.size.width, 20)];
    searchLabel.text = @"账号查询";
    searchLabel.textColor = [UIColor carrotColor];
    searchLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:searchLabel];
    
    // LOL小说查询按钮
    UIButton *novelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    novelButton.frame = CGRectMake(informationButton.frame.origin.x, searchButton.frame.origin.y, kViewWidth / 5, kViewWidth / 5);
    // 为小说按钮设置背景
    [novelButton setBackgroundImage:[UIImage imageNamed:@"novel"] forState:UIControlStateNormal];
    // 为小说按钮设置方法
    [novelButton addTarget:self action:@selector(doTapNovelButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:novelButton];
    
    UILabel *novelLabel = [[UILabel alloc] initWithFrame:CGRectMake(novelButton.frame.origin.x, novelButton.frame.origin.y + novelButton.frame.size.height + 10, novelButton.bounds.size.width, 20)];
    novelLabel.text = @"LOL小说";
    novelLabel.textColor = [UIColor carrotColor];
    novelLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:novelLabel];

}

- (void)doTapFightButton:(UIButton *)button {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL isLogin = [userDefaults boolForKey:@"isLogin"];
    if (isLogin == YES) {
        
        FightViewController *fightVC = [[FightViewController alloc] init];
        fightVC.name = [userDefaults objectForKey:@"name"];
        fightVC.serverName = [userDefaults objectForKey:@"server"];
        [self.navigationController pushViewController:fightVC animated:YES];
    } else {
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];
    }
}

- (void)doTapInformationButton:(UIButton *)button {
    
    EncyclopediaViewController *encyclopediaVC = [[EncyclopediaViewController alloc] init];
    
    [self.navigationController pushViewController:encyclopediaVC animated:YES];
}

- (void)doTapSearchButton:(UIButton *)button {
    
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    
    [self.navigationController pushViewController:searchVC animated:YES];
}

- (void)doTapNovelButton:(UIButton *)button {
    
    NovelViewController *novelVC = [[NovelViewController alloc] init];
    
    [self.navigationController pushViewController:novelVC animated:YES];
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
