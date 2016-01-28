//
//  FightViewController.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "BaseViewController.h"

@interface FightViewController : BaseViewController

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *serverName;;
@property (nonatomic, copy) NSString *binding; // 是否绑定账号，是从绑定战斗力界面进 还是直接进
@end
