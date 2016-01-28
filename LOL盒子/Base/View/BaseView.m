//
//  BaseView.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        // 设置视图上方imageView
        _topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight / 7)];
        _topImageView.image = [UIImage imageNamed:@"main3.jpg"];
        // 打开用户交互
        _topImageView.userInteractionEnabled = YES;
        _backButton = [[UIButton alloc] initWithFrame:CGRectMake(20, kHeight / 15, 40, 40)];
        [_backButton setImage:[UIImage imageNamed:@"small"] forState:UIControlStateNormal];
        [_topImageView addSubview:_backButton];
        [self addSubview:_topImageView];
        
        // 设置视图下方view
        _bottomView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kHeight / 7, kWidth, kHeight / 7 * 6)];
        _bottomView.backgroundColor = [UIColor blackColor];
        [self addSubview:_bottomView];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
