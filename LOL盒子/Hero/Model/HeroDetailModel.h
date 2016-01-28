//
//  HeroDetailModel.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HeroSkillModel;
@class HeroModel;

@interface HeroDetailModel : NSObject

//  初始化HeroModel方法
- (instancetype)initWithHero:(HeroModel *)hero;
@property (nonatomic, strong) HeroModel *hero;

@property (nonatomic, copy) NSString *nameId; // 英雄id
@property (nonatomic, copy) NSString *name; // 英雄英文名
@property (nonatomic, copy) NSString *displayName; // 英雄称号
@property (nonatomic, copy) NSString *title; // 英雄中文名
@property (nonatomic, copy) NSString *iconPath; // 英雄头像
@property (nonatomic, copy) NSString *portraitPath; // 英雄肖像
@property (nonatomic, copy) NSString *splashPath; // 英雄xx
@property (nonatomic, copy) NSString *tags; // 英雄类型
@property (nonatomic, copy) NSString *heroDescription; // 英雄描述
@property (nonatomic, copy) NSString *quote; // 引用
@property (nonatomic, copy) NSString *quoteAuthor; // 引用作者
@property (nonatomic, copy) NSString *range; // 攻击范围
@property (nonatomic, copy) NSString *moveSpeed; // 移动速度
@property (nonatomic, copy) NSString *armorBase; // 基础护甲
@property (nonatomic, copy) NSString *armorLevel; // 护甲每级增长
@property (nonatomic, copy) NSString *manaBase; // 基础魔法值
@property (nonatomic, copy) NSString *manaLevel; // 魔法值每级增长
@property (nonatomic, copy) NSString *criticalChanceBase; // 基础暴击
@property (nonatomic, copy) NSString *criticalChanceLevel; // 暴击每级增长
@property (nonatomic, copy) NSString *manaRegenBase; // 魔法值每秒恢复
@property (nonatomic, copy) NSString *manaRegenLevel; // 魔法值每秒恢复增长
@property (nonatomic, copy) NSString *healthRegenBase; // 生命值每秒恢复
@property (nonatomic, copy) NSString *healthRegenLevel; // 生命值每秒恢复增长
@property (nonatomic, copy) NSString *magicResistBase; // 魔法抗性
@property (nonatomic, copy) NSString *magicResistLevel; // 魔法抗性每级增长
@property (nonatomic, copy) NSString *healthBase; // 生命值基础
@property (nonatomic, copy) NSString *healthLevel; // 生命值每级增长
@property (nonatomic, copy) NSString *attackBase; // 攻击力基础
@property (nonatomic, copy) NSString *attackLevel; // 攻击力每级增长
@property (nonatomic, copy) NSString *ratingDefense; // 防御评分
@property (nonatomic, copy) NSString *ratingMagic; // 法术评分
@property (nonatomic, copy) NSString *ratingDifficulty; // 操作难度评分
@property (nonatomic, copy) NSString *ratingAttack; // 攻击力评分
@property (nonatomic, copy) NSString *tips; // 使用技巧
@property (nonatomic, copy) NSString *opponentTips; // 针对技巧
@property (nonatomic, strong) HeroSkillModel *skill_B; // 被动技能
@property (nonatomic, strong) HeroSkillModel *skill_Q; // Q技能
@property (nonatomic, strong) HeroSkillModel *skill_W; // W技能
@property (nonatomic, strong) HeroSkillModel *skill_E; // E技能
@property (nonatomic, strong) HeroSkillModel *skill_R; // R技能
@property (nonatomic, strong) NSArray *like; // 搭档
@property (nonatomic, strong) NSArray *hate; // 克制


@end
