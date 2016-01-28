//
//  HeroCompareViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroCompareViewController.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "HeroCompareTopView.h"
#import "HeroDetailModel.h"
#import "UIColor+AddColor.h"
#import "SelectHeroViewController.h"
#import "HeroDataCompareView.h"
#import "HeroSkillCompareView.h"
#import "HeroModel.h"

@interface HeroCompareViewController ()

@property (nonatomic, strong) HeroCompareTopView *heroCompareTV; // 英雄对比上方视图
@property (nonatomic, strong) HeroDataCompareView *heroDataCompareView; // 英雄属性比较
@property (nonatomic, strong) HeroSkillCompareView *heroSkillCompareView; // 英雄技能比较

@end

@implementation HeroCompareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.heroCompareTV = [[HeroCompareTopView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7, kViewWidth, kViewHeight / 6)];
    self.heroCompareTV.enName = self.heroDetail.hero.enName;
    // 添加敌方英雄按钮方法
    [self.heroCompareTV.enemyHeroButton addTarget:self action:@selector(doTapEnemyHeroButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.heroCompareTV];
    
    // 创建segmentedControl 并设置属性
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"属性对比", @"技能对比"]];
    segmentedControl.frame = CGRectMake(0, kViewHeight / 7 + kViewHeight / 6, kViewWidth, 30);
    segmentedControl.selectedSegmentIndex = 1;
    segmentedControl.tintColor = [UIColor carrotColor];
    [segmentedControl addTarget:self action:@selector(changeSegmentedAction:) forControlEvents:UIControlEventValueChanged];
    // 添加到父视图上
    [self.view addSubview:segmentedControl];

    // 添加英雄属性比较视图
    self.heroDataCompareView = [[HeroDataCompareView alloc] initWithFrame:CGRectMake(0, segmentedControl.frame.origin.y + segmentedControl.frame.size.height, kViewWidth, kViewHeight - segmentedControl.frame.origin.y - segmentedControl.frame.size.height)];
    self.heroDataCompareView.tag = 5000;
    [self.view addSubview:self.heroDataCompareView];
    self.heroDataCompareView.heroDetail = self.heroDetail;
    
    // 添加英雄技能比较视图
    self.heroSkillCompareView = [[HeroSkillCompareView alloc] initWithFrame:CGRectMake(0, segmentedControl.frame.origin.y + segmentedControl.frame.size.height, kViewWidth, kViewHeight - segmentedControl.frame.origin.y - segmentedControl.frame.size.height)];
    self.heroSkillCompareView.tag = 5001;
    [self.view addSubview:self.heroSkillCompareView];
    self.heroSkillCompareView.ownerHeroDetail = self.heroDetail;
    
//    [self.view bringSubviewToFront:self.heroDataCompareView];
}

- (void)setHeroDetail:(HeroDetailModel *)heroDetail {
    
    if (_heroDetail != heroDetail) {
        _heroDetail = heroDetail;
    }
}
//  点击segment方法
- (void)changeSegmentedAction:(UISegmentedControl *)segment {
    
    UIView *view = [self.view viewWithTag:segment.selectedSegmentIndex + 5000];
    [self.view bringSubviewToFront:view];
}

//  实现敌方英雄按钮方法
- (void)doTapEnemyHeroButton:(UIButton *)button {
    
    SelectHeroViewController *selectHeroVC = [[SelectHeroViewController alloc] init];
    selectHeroVC.heroBlock = ^(HeroDetailModel *heroDetail) {
        //英雄选择视图赋值
        self.heroCompareTV.enemyName = heroDetail.hero.enName;
        //英雄数据视图中己方英雄赋值
        self.heroDataCompareView.enemyHeroDetail = heroDetail;
        
        //英雄技能比较视图中 敌方 英雄 赋值
        self.heroSkillCompareView.enemyHeroDetail = heroDetail;
    };
    [self.navigationController pushViewController:selectHeroVC animated:YES];
    
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
