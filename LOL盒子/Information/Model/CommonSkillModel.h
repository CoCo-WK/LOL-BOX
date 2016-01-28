//
//  CommonSkillModel.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonSkillModel : NSObject

@property (nonatomic, copy) NSString *name; //卫戍部队,
@property (nonatomic, copy) NSString *skillId; //17,
@property (nonatomic, copy) NSString *level; //1,
@property (nonatomic, copy) NSString *cooldown; //210,
@property (nonatomic, copy) NSString *des; //对友军防御塔使用——回复速度和攻击速度大幅度提高,持续8秒.对敌方防御塔——攻击力降低80%,持续8秒。,
@property (nonatomic, copy) NSString *strong; //,
@property (nonatomic, copy) NSString *tips; //支持的游戏模式： 统治战场。

@end
