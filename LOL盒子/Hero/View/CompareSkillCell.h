//
//  CompareSkillCell.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeroSkillModel;

@interface CompareSkillCell : UITableViewCell

@property (nonatomic, strong) UIButton *ownerButton;  //己方button
@property (nonatomic, strong) UIButton *enemyButton;  //敌方Button

@property (nonatomic, strong) UIImageView *ownerImageView;  //己方挡板图片
@property (nonatomic, strong) UIImageView *enemyImageView;  //敌方挡板图片

@property (nonatomic, strong) HeroSkillModel *skillModel;//自己的model接收传值

- (void)setHeroOwnerName:(NSString *)ownerName enemyName:(NSString *)enemyName skillTypeName:(NSString *)skillTypeName;
@end
