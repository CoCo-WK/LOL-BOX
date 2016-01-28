//
//  CommonSkillModel.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "CommonSkillModel.h"

@implementation CommonSkillModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        self.skillId = value;
    }
}
@end
