//
//  MainView.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "MainView.h"
#import "UIColor+AddColor.h"
#import "Singleton.h"

@implementation MainView

//  初始化首页，并设置属性
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        // 添加首页上方的图片
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight / 2)];
        _imageView.image = [UIImage imageNamed:@"main4.jpg"];
        [self addSubview:_imageView];
        
        // 添加首页下方的图片
        _view = [[UIView alloc] initWithFrame:CGRectMake(0, kHeight / 2, kWidth, kHeight / 2)];
        _view.backgroundColor = [UIColor blackColor];
        
        // 添加英雄按钮
        _heroButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _heroButton.frame = CGRectMake(40, 10, kWidth / 4, kHeight / 7);
        [_heroButton setBackgroundImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
        UILabel *heroLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _heroButton.bounds.size.height / 5 * 4, _heroButton.bounds.size.width, _heroButton.bounds.size.height / 5)];
        heroLabel.alpha = 0.8;
        heroLabel.text = @"英雄";
        heroLabel.textColor = [UIColor whiteColor];
        heroLabel.backgroundColor = [UIColor blackColor];
        heroLabel.textAlignment = NSTextAlignmentCenter;
        [_heroButton addSubview:heroLabel];
        [_view addSubview:_heroButton];
        
        // 添加装备按钮
        _equipmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _equipmentButton.frame = CGRectMake(kWidth / 4 * 3 - 40, 10, kWidth / 4, kHeight / 7);
        [_equipmentButton setBackgroundImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
        UILabel *equipmentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _equipmentButton.bounds.size.height / 5 * 4, _equipmentButton.bounds.size.width, _equipmentButton.bounds.size.height / 5)];
        equipmentLabel.alpha = 0.8;
        equipmentLabel.text = @"装备";
        equipmentLabel.textColor = [UIColor whiteColor];
        equipmentLabel.backgroundColor = [UIColor blackColor];
        equipmentLabel.textAlignment = NSTextAlignmentCenter;
        [_equipmentButton addSubview:equipmentLabel];

        [_view addSubview:_equipmentButton];
        
        // 添加资料按钮
        _informationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _informationButton.frame = CGRectMake(kWidth / 3 + 10, kHeight / 5, kWidth / 4, kHeight / 7);
        [_informationButton setBackgroundImage:[UIImage imageNamed:@"4"] forState:UIControlStateNormal];
        UILabel *informationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _informationButton.bounds.size.height / 5 * 4, _informationButton.bounds.size.width, _informationButton.bounds.size.height / 5)];
        informationLabel.alpha = 0.8;
        informationLabel.text = @"资料";
        informationLabel.textColor = [UIColor whiteColor];
        informationLabel.backgroundColor = [UIColor blackColor];
        informationLabel.textAlignment = NSTextAlignmentCenter;
        [_informationButton addSubview:informationLabel];

        [_view addSubview:_informationButton];
        
        // 设置动画效果 (duration 为动画周期时间 delay 为延迟动画时间)
        [MainView animateKeyframesWithDuration:1.5 delay:0 options: UIViewKeyframeAnimationOptionAllowUserInteraction animations:^{
            
            // 设置自动返回
            [MainView setAnimationRepeatAutoreverses:YES];
            // 设置重复次数为最大
            [MainView setAnimationRepeatCount:NSUIntegerMax];
            // 设置动画效果
            self.heroButton.transform = CGAffineTransformMakeRotation(M_PI_4);
            self.equipmentButton.transform = CGAffineTransformMakeRotation(- M_PI_4);
//            self.informationButton.transform = CGAffineTransformMakeRotation(M_PI_4);
//            self.informationButton.transform = CGAffineTransformMakeRotation(- M_PI_4);
//            self.heroButton.transform = CGAffineTransformMakeScale(1.2, 1.2);
//            self.equipmentButton.transform = CGAffineTransformMakeScale(1.2, 1.2);
            self.informationButton.transform = CGAffineTransformMakeScale(1.2, 1.2);
            self.informationButton.transform = CGAffineTransformMakeScale(0.9, 0.9);
        } completion:nil];
        
        [self addSubview:_view];
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
