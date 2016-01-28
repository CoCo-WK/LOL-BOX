//
//  BestTeamDetailCell.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BestTeamModel;

@interface BestTeamDetailCell : UITableViewCell

@property (nonatomic, strong) BestTeamModel *bestTeam; // 传值

- (void)setBestTeam:(BestTeamModel *)bestTeam atIndexPathRow:(NSInteger)num;

@end
