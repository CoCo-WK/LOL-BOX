//
//  HeroDetailViewController.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "BaseViewController.h"
@class HeroModel;

@interface HeroDetailViewController : BaseViewController

@property (nonatomic, strong) HeroModel *hero; // 用于属性传值
@end
