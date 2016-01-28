//
//  BestTeamCell.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BestTeamModel;

@interface BestTeamCell : UITableViewCell

@property (nonatomic, strong) BestTeamModel *bestTeam; // 传值
@property (nonatomic, strong) UILabel *desLabel;
@property (nonatomic, copy) NSString *str; // 用来判断 详细介绍是否自适应

- (void)layoutSubviewsAgain;
@end
