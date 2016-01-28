//
//  HeroCompareTopView.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroCompareTopView.h"
#import "UIColor+AddColor.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

@interface HeroCompareTopView ()

@property (nonatomic, strong) UILabel *vsLabel; // 显示VS
@property (nonatomic, strong) UILabel *myLabel; // 显示己方
@property (nonatomic, strong) UILabel *enemyLabel; //显示敌方

@end

@implementation HeroCompareTopView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
      
        _myHeroImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth / 5, 20, kWidth / 6, kWidth / 6)];
        [self addSubview:_myHeroImageView];
        
        _enemyHeroButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _enemyHeroButton.frame = CGRectMake(kWidth - kWidth / 5 - kWidth / 6, _myHeroImageView.frame.origin.y, kWidth / 6, kWidth / 6);
        [_enemyHeroButton setBackgroundImage:[UIImage imageNamed:@"hero"] forState:UIControlStateNormal];
        [self addSubview:_enemyHeroButton];
        
        _vsLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth / 2 - 15, kHeight / 4 + 10, 30, 30)];
        _vsLabel.text = @"VS";
        _vsLabel.textColor = [UIColor redColor];
        _vsLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_vsLabel];
        
        _myLabel = [[UILabel alloc] initWithFrame:CGRectMake(_myHeroImageView.frame.origin.x, _myHeroImageView.frame.origin.y + _myHeroImageView.bounds.size.height, _myHeroImageView.frame.size.width, 20)];
        _myLabel.text = @"己方";
        _myLabel.textColor = [UIColor carrotColor];
        _myLabel.font = [UIFont systemFontOfSize:13];
        _myLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_myLabel];
        
        _enemyLabel = [[UILabel alloc] initWithFrame:CGRectMake(_enemyHeroButton.frame.origin.x, _enemyHeroButton.frame.origin.y + _enemyHeroButton.bounds.size.height, _enemyHeroButton.frame.size.width, 20)];
        _enemyLabel.text = @"敌方";
        _enemyLabel.textColor = [UIColor redColor];
        _enemyLabel.font = [UIFont systemFontOfSize:13];
        _enemyLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_enemyLabel];
    }
    return self;
}

#pragma mark  重写setter方法
- (void)setEnName:(NSString *)enName {
    if (_enName != enName) {
        _enName = enName;
        
        //给内部控件赋值
        [_myHeroImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", _enName]] placeholderImage:nil];
    }
}
- (void)setEnemyName:(NSString *)enemyName {
    if (_enemyName != enemyName) {
        _enemyName = enemyName;
        
        //给图片赋值
        [self.enemyHeroButton sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", _enemyName]] forState:(UIControlStateNormal)];
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
