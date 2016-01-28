//
//  HeroDetailTopView.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroDetailTopView.h"
#import "HeroModel.h"
#import "UIImageView+WebCache.h"
#import "UIColor+AddColor.h"

@implementation HeroDetailTopView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, frame.size.height - 20, frame.size.height - 20)];
        [self addSubview:_iconImageView];
        
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _playButton.frame = _iconImageView.frame;
        _playButton.backgroundColor = [UIColor clearColor];
        [self addSubview:_playButton];
        
        _cnNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_iconImageView.bounds.size.width + 20, _iconImageView.frame.origin.y, frame.size.width / 2, _iconImageView.bounds.size.height / 3)];
        _cnNameLabel.textColor = [UIColor whiteColor];
        _cnNameLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_cnNameLabel];
        
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(_cnNameLabel.frame.origin.x, _cnNameLabel.frame.origin.y + _cnNameLabel.bounds.size.height, _cnNameLabel.bounds.size.width, _cnNameLabel.bounds.size.height)];
        _priceLabel.textColor = [UIColor whiteColor];
        _priceLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_priceLabel];
        
        _ratingLabel = [[UILabel alloc] initWithFrame:CGRectMake(_cnNameLabel.frame.origin.x, _priceLabel.frame.origin.y + _priceLabel.bounds.size.height, _cnNameLabel.bounds.size.width, _cnNameLabel.bounds.size.height)];
        _ratingLabel.textColor = [UIColor whiteColor];
        _ratingLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_ratingLabel];
        
        _compareButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_compareButton setTitle:@"英雄对比" forState:UIControlStateNormal];
        [_compareButton setBackgroundColor:[UIColor carrotColor]];
        _compareButton.frame = CGRectMake(kWidth / 3 * 2 + 20, _iconImageView.frame.origin.y, kWidth / 5, _iconImageView.bounds.size.height / 2 - 5);
        _compareButton.layer.cornerRadius = 10;
        [self addSubview:_compareButton];
        
        _talentButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_talentButton setTitle:@"天赋符文" forState:UIControlStateNormal];
        [_talentButton setBackgroundColor:[UIColor carrotColor]];
        _talentButton.frame = CGRectMake(kWidth / 3 * 2 + 20, _iconImageView.frame.origin.y + _iconImageView.bounds.size.height / 2 + 5, kWidth / 5, _iconImageView.bounds.size.height / 2 - 5);
        _talentButton.layer.cornerRadius = 10;
        [self addSubview:_talentButton];
    }
    return self;
}

- (void)setHero:(HeroModel *)hero {
    
    _hero = hero;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", hero.enName]] placeholderImage:nil];
    NSArray *arr = [hero.price componentsSeparatedByString:@","];
    self.cnNameLabel.text = hero.cnName;
    self.priceLabel.text = [NSString stringWithFormat:@"金:%@ 券:%@",arr[0], arr[1]];
    NSArray *ratingArr = [hero.rating componentsSeparatedByString:@","];
    self.ratingLabel.text = [NSString stringWithFormat:@"攻:%@ 防:%@ 法:%@ 难:%@",ratingArr[0], ratingArr[1], ratingArr[2], ratingArr[3]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
