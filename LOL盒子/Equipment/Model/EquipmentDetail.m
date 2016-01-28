//
//  EquipmentDetail.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipmentDetail.h"

@implementation EquipmentDetail

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        _equipmentId = value;
    }
    if ([key isEqualToString:@"description"]) {
        _equipmentDescription = value;
    }
}

@end
