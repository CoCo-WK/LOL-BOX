//
//  HeroDetailModel.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroDetailModel.h"
#import "HeroModel.h"
#import "HeroSkillModel.h"

@implementation HeroDetailModel

- (instancetype)initWithHero:(HeroModel *)hero {
    
    self = [super init];
    if (self) {
        
        self.hero = hero;
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        
        _nameId = value;
    }
    if ([key isEqualToString:@"description"]) {
        
        _heroDescription = value;
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_B", self.hero.enName]]) {
        
        _skill_B = [[HeroSkillModel alloc] initWithDictionary:value];
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_Q", self.hero.enName]]) {
        
        _skill_Q = [[HeroSkillModel alloc] initWithDictionary:value];
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_W", self.hero.enName]]) {
        
        _skill_W = [[HeroSkillModel alloc] initWithDictionary:value];
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_E", self.hero.enName]]) {
        
        _skill_E = [[HeroSkillModel alloc] initWithDictionary:value];
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_R", self.hero.enName]]) {
        
        _skill_R = [[HeroSkillModel alloc] initWithDictionary:value];
    }
    
}

- (void)setNilValueForKey:(NSString *)key {
    
}

@end
