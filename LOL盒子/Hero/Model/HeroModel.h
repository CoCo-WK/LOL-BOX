//
//  HeroModel.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroModel : NSObject

@property (nonatomic, copy) NSString *enName; // 英文名字
@property (nonatomic, copy) NSString *cnName; // 中文名字
@property (nonatomic, copy) NSString *title; // 英雄标题
@property (nonatomic, copy) NSString *rating; // 英雄难度评分
@property (nonatomic, copy) NSString *location; // 英雄定位
@property (nonatomic, copy) NSString *price; // 英雄价格
@property (nonatomic, copy) NSString *presentTimes; // 英雄场次
@property (nonatomic, copy) NSString *tags;

@end
