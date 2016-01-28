//
//  BaseView.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

@property (nonatomic, strong) UIImageView *topImageView; // 视图上方
@property (nonatomic, strong) UIImageView *bottomView; // 视图下方
@property (nonatomic, strong) UIButton *backButton; // 返回按钮

@end
