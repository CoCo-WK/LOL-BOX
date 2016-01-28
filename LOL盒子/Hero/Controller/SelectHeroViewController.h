//
//  SelectHeroViewController.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "BaseViewController.h"
@class HeroDetailModel;

typedef void(^passHeroDetail)(HeroDetailModel *heroDetail);

@interface SelectHeroViewController : BaseViewController
//  定义block传值
@property (nonatomic, copy) passHeroDetail heroBlock;

@end
