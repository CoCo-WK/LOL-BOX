//
//  Singleton.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/21.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Singleton : NSObject

+ (Singleton *)defaultColor;

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIImage *image;
@end
