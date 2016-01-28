//
//  MyHeroCell.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyHeroCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconImageView; // 英雄头像
@property (nonatomic, strong) UILabel *cnNameLabel; // 英雄中文名
@property (nonatomic, strong) UILabel *titleLabel; // 英雄标题
@property (nonatomic, strong) UILabel *presentTimesLabel; // 英雄使用次数

@end
