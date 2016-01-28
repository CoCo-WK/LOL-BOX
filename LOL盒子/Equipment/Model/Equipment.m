//
//  Equipment.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "Equipment.h"

@implementation Equipment

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
   
    if ([key isEqualToString:@"tag"]) {
        self.equipTag = value;
    }
}

@end
