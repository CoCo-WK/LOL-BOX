//
//  RuneModel.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuneModel : NSObject

@property (nonatomic, copy)NSString *Name; // 符文名称
@property (nonatomic, copy)NSString *Alias; // A1,
@property (nonatomic, copy)NSString *lev1; // +0.52,
@property (nonatomic, copy)NSString *lev2; // +0.72,
@property (nonatomic, copy)NSString *lev3; // +0.93,
@property (nonatomic, copy)NSString *iplev1; // （已移除）
@property (nonatomic, copy)NSString *iplev2; // （已移除）
@property (nonatomic, copy)NSString *iplev3; // 410
@property (nonatomic, copy)NSString *Prop; // 暴击几率
@property (nonatomic, copy)NSString *Type; // 1
@property (nonatomic, copy)NSString *Recom; // 1
@property (nonatomic, copy)NSString *Img; // r_3
@property (nonatomic, copy)NSString *Units;
@property (nonatomic, copy)NSString *Standby;

@end
