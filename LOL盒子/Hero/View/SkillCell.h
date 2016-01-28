//
//  SkillCell.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeroSkillModel;

@interface SkillCell : UITableViewCell

@property (nonatomic, strong) HeroSkillModel *skillModel; // 用来传值
@property (nonatomic, copy) NSString *str; // 用来传值
//  技能按钮
@property (nonatomic, strong) UIButton *buttonB;
@property (nonatomic, strong) UIButton *buttonQ;
@property (nonatomic, strong) UIButton *buttonW;
@property (nonatomic, strong) UIButton *buttonE;
@property (nonatomic, strong) UIButton *buttonR;
//  技能按钮挡板
@property (nonatomic, strong) UIImageView *imageViewB;
@property (nonatomic, strong) UIImageView *imageViewQ;
@property (nonatomic, strong) UIImageView *imageViewW;
@property (nonatomic, strong) UIImageView *imageViewE;
@property (nonatomic, strong) UIImageView *imageViewR;
//  技能详情
@property (nonatomic, strong)UILabel *skillNameLabel;//技能名称
@property (nonatomic, strong)UILabel *descriptionLabel;//描述
@property (nonatomic, strong)UILabel *costLabel;//消耗
@property (nonatomic, strong)UILabel *cooldownLabel;//冷却
@property (nonatomic, strong)UILabel *rangeLabel;//范围
@property (nonatomic, strong)UILabel *effectLabel;//效果
@property (nonatomic, strong)UILabel *descriptionDLabel;//描述详情
@property (nonatomic, strong)UILabel *costDLabel;//消耗详情
@property (nonatomic, strong)UILabel *cooldownDLabel;//冷却详情
@property (nonatomic, strong)UILabel *rangeDLabel;//范围详情
@property (nonatomic, strong)UILabel *effectDLabel;//效果详情

@end
