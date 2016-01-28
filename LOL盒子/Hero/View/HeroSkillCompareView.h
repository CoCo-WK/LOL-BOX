//
//  HeroSkillCompareView.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeroDetailModel;

@interface HeroSkillCompareView : UIView

@property (nonatomic, strong) UITableView *tableView; // 表视图
@property (nonatomic, strong)HeroDetailModel *ownerHeroDetail;  //model  传值
@property (nonatomic, strong)HeroDetailModel *enemyHeroDetail;   //敌方英雄model
@end
