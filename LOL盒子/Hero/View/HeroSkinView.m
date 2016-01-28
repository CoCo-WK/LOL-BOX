//
//  HeroSkinView.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroSkinView.h"
#import "UIImageView+WebCache.h"
#import "HeroSkinModel.h"

//  英雄皮肤
@interface HeroSkinView () <UIScrollViewDelegate>

@property (nonatomic, strong) UILabel *nameLabel; //名字
@property (nonatomic, strong) UILabel *priceLabel; // 价格
@property (nonatomic, strong) UILabel *countLabel; // 页数

@end

@implementation HeroSkinView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.pagingEnabled = YES;
        self.delegate = self;
    }
    return self;
}

- (void)setSkinArr:(NSMutableArray *)skinArr {
    
    if (_skinArr != skinArr) {
        _skinArr = skinArr;
    }
    self.contentSize = CGSizeMake(kWidth * _skinArr.count, 0);
    for (int i = 0; i < _skinArr.count; i++) {
        
        // 皮肤大图
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth * i, kWidth / 7, kWidth, kHeight / 2)];
        HeroSkinModel *skinModel = _skinArr[i];
        [imageView sd_setImageWithURL:[NSURL URLWithString:skinModel.bigImg] placeholderImage:nil];
        [self addSubview:imageView];
        // 皮肤的名称
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 + kWidth * i, kWidth / 7 * 6, kWidth - 20, 30)];
        _nameLabel.text = skinModel.name;
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont systemFontOfSize:17];
        [self addSubview:_nameLabel];
        // 皮肤价格
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 + kWidth * i, kWidth / 7 * 6 + 30, kWidth - 20, 30)];
        if ([skinModel.price intValue]) {
            _priceLabel.text = [NSString stringWithFormat:@"%@点券", skinModel.price];
        } else if(i == 0) {
            _priceLabel.text = @"经典皮肤";
        } else {
            _priceLabel.text = @"限定皮肤";
        }
        _priceLabel.textColor = [UIColor whiteColor];
        _priceLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_priceLabel];
        // 页数
        _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 + kWidth * i, 10, kWidth - 40, 30)];
        _countLabel.text = [NSString stringWithFormat:@"%d/%ld", i + 1, _skinArr.count];
        _countLabel.textAlignment = NSTextAlignmentCenter;
        _countLabel.textColor = [UIColor whiteColor];
        [self addSubview:_countLabel];

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
