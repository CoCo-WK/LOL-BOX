//
//  EquipmentDetail.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EquipmentDetail : NSObject

@property (nonatomic, strong)NSString *equipmentId;  //装备id
@property (nonatomic, strong)NSString *name; // 装备名字
@property (nonatomic, strong)NSString *equipmentDescription; // 装备描述
@property (nonatomic, strong)NSString *price; // 装备价格
@property (nonatomic, strong)NSString *allPrice; // 所有价格
@property (nonatomic, strong)NSString *sellPrice; // 售价
@property (nonatomic, strong)NSString *tags; // 标记
@property (nonatomic, strong)NSDictionary *extAttrs; //增加的属性
@property (nonatomic, strong)NSString *need; // 需求
@property (nonatomic, strong)NSString *compose; // 可合成的装备
@property (nonatomic, strong)NSString *extDesc; // 唯一属性

@end
