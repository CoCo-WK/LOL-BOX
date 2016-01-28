//
//  HeroSkinModel.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroSkinModel : NSObject

@property (nonatomic, copy) NSString *bigImg; // 大图
@property (nonatomic, copy) NSString *skinId; // 皮肤编号
@property (nonatomic, copy) NSString *name; // 皮肤名称
@property (nonatomic, copy) NSString *price; // 皮肤价格
@property (nonatomic, copy) NSString *smallImg; // 小图

@end
