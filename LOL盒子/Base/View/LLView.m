//
//  LLView.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "LLView.h"

@interface LLView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation LLView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
       
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
        
        _detailLabel = [[UILabel alloc] init];
        [self addSubview:_detailLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _titleLabel.frame = CGRectMake(0, 0, kWidth / 3, self.bounds.size.height);
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentRight;
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.text = _title;
    
    _detailLabel.frame = CGRectMake(kWidth / 3 + 20, 0, kWidth / 3 * 2 - 20, _titleLabel.bounds.size.height);
    _detailLabel.textColor = [UIColor whiteColor];
    _detailLabel.textAlignment = NSTextAlignmentLeft;
    _detailLabel.font = [UIFont systemFontOfSize:15];
}

- (void)setDetail:(NSString *)detail {
    
    if (_detail != detail) {
        
        _detail = detail;
        _detailLabel.text = _detail;
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
