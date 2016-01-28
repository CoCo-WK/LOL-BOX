//
//  HeroSkillModel.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroSkillModel : NSObject

@property (nonatomic, copy) NSString *skillId; // 技能id
@property (nonatomic, copy) NSString *name; // 技能名称
@property (nonatomic, copy) NSString *cost; // 技能消耗
@property (nonatomic, copy) NSString *cooldown; // 技能冷却
@property (nonatomic, copy) NSString *skillDescription; // 技能描述
@property (nonatomic, copy) NSString *range; // 技能范围
@property (nonatomic, copy) NSString *effect; // 技能效果

//把它的kvc赋值写在了自定义方法中
- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
