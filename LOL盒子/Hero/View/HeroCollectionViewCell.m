//
//  HeroCollectionViewCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroCollectionViewCell.h"
#import "HeroModel.h"
#import "UIImageView+WebCache.h"

@interface HeroCollectionViewCell ()

@property (nonatomic, strong) UIImageView *iconImageView; // 英雄头像
@property (nonatomic, strong) UILabel *cnNameLabel; // 英雄中文名
@property (nonatomic, strong) UILabel *titleLabel; // 英雄标题
@property (nonatomic, strong) UILabel *locationLabel; // 英雄定位

@end

@implementation HeroCollectionViewCell

//  初始化方法
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.height, frame.size.height)];
        [self.contentView addSubview:_iconImageView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_iconImageView.bounds.size.width + 5, 0, frame.size.width - _iconImageView.bounds.size.width - 5, frame.size.height / 3)];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_titleLabel];
        
        _cnNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.bounds.size.height, self.titleLabel.bounds.size.width, self.titleLabel.bounds.size.height)];
        _cnNameLabel.textColor = [UIColor whiteColor];
        _cnNameLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_cnNameLabel];
        
        _locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.frame.origin.x, self.cnNameLabel.bounds.size.height * 2, self.titleLabel.bounds.size.width, self.titleLabel.bounds.size.height)];
        _locationLabel.textColor = [UIColor purpleColor];
        _locationLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_locationLabel];
        
    }
    return self;
}

- (void)setHero:(HeroModel *)hero {
    
    _hero = hero;
    _cnNameLabel.text = hero.cnName;
    _titleLabel.text = hero.title;
    _locationLabel.text = hero.location;
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", hero.enName]]placeholderImage:nil];
}
@end
