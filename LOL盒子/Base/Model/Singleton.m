//
//  Singleton.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/21.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

+ (Singleton *)defaultColor {
    
    static Singleton *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[Singleton alloc] init];
        singleton.color = [UIColor blackColor];
        singleton.image = [UIImage imageNamed:@"main4.jpg"];
    });
    return singleton;
}

@end
