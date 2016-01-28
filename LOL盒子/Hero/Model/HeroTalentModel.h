//
//  HeroTalentModel.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroTalentModel : NSObject

@property (nonatomic, copy) NSString *title; // 标题
@property (nonatomic, copy) NSString *name; // 英雄名字
@property (nonatomic, retain)NSString *fuPic;// 符文图片地址
@property (nonatomic, retain)NSString *fuDes;//符文描述
@property (nonatomic, retain)NSString *tianPic; //天赋图片地址
@property (nonatomic, retain)NSString *tianDes; //天赋描述
@property (nonatomic, retain)NSString *des;  //描述

@end
