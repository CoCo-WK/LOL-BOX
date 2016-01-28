//
//  MainView.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIView

@property (nonatomic, strong) UIImageView *imageView; // 首页上方
@property (nonatomic, strong) UIView *view; // 首页下方
@property (nonatomic, strong) UIButton *heroButton; // 英雄按钮
@property (nonatomic, strong) UIButton *equipmentButton; // 装备按钮
@property (nonatomic, strong) UIButton *informationButton; // 资料按钮

@end
