//
//  CompareDataCell.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompareDataCell : UITableViewCell

@property (nonatomic, retain)NSString *attributeName; // 属性名称
@property (nonatomic, retain)NSString *ownerValue; // 己方属性
@property (nonatomic, retain)NSString *enemyValue; // 敌方属性

@end
