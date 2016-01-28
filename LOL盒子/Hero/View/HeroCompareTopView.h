//
//  HeroCompareTopView.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroCompareTopView : UIView

@property (nonatomic, retain)NSString *enName;   //己方图片name
@property (nonatomic, retain)NSString *enemyName;   //敌方图片name
@property (nonatomic, strong) UIButton *enemyHeroButton; // 敌方英雄图标
@property (nonatomic, strong) UIImageView *myHeroImageView; // 我的英雄图标

@end
