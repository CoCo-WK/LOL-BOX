//
//  HeroSkillModel.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroSkillModel.h"

@implementation HeroSkillModel

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        
        _skillId = value;
    }
    if ([key isEqualToString:@"description"]) {
        
        _skillDescription = value;
    }
}

- (void)setNilValueForKey:(NSString *)key {
    
}

@end
