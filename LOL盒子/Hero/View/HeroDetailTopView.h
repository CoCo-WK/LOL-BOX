//
//  HeroDetailTopView.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeroModel;

@interface HeroDetailTopView : UIView

@property (nonatomic, strong) UIImageView *iconImageView; // 英雄头像
@property (nonatomic, strong) UILabel *cnNameLabel; // 英雄中文名字
@property (nonatomic, strong) UILabel *priceLabel; // 英雄价格
@property (nonatomic, strong) UILabel *ratingLabel; // 英雄评分
@property (nonatomic, strong) UIButton *compareButton; // 英雄对比
@property (nonatomic, strong) UIButton *talentButton; // 天赋符文
//  用于播放声音的button
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) HeroModel *hero;

@end
