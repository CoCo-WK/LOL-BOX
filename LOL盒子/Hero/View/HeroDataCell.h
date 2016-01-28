//
//  HeroDataCell.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeroDetailModel;

@interface HeroDataCell : UITableViewCell

@property (nonatomic, strong) UISlider *slider; // 滑块
@property (nonatomic, strong) HeroDetailModel *heroDetail; // 用于传值
@property (nonatomic, assign) NSInteger value; // 用于传值
@end
