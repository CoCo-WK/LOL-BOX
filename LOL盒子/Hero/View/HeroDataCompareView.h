//
//  HeroDataCompareView.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeroDetailModel;

@interface HeroDataCompareView : UIView

@property (nonatomic, strong) HeroDetailModel *heroDetail; // 用于传值
@property (nonatomic, strong) HeroDetailModel *enemyHeroDetail; // 敌方model
@end
