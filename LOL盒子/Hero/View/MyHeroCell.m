//
//  MyHeroCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "MyHeroCell.h"

@implementation MyHeroCell

//  初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 5, 70, 70)];
        [self.contentView addSubview:_iconImageView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_iconImageView.bounds.size.width + 40, _iconImageView.frame.origin.y, kWidth / 3, _iconImageView.bounds.size.height / 2)];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_titleLabel];
        
        _cnNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_titleLabel.frame.origin.x + kWidth / 3, _iconImageView.frame.origin.y, kWidth / 4, _iconImageView.bounds.size.height / 2)];
        _cnNameLabel.textColor = [UIColor whiteColor];
        _cnNameLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_cnNameLabel];
        
        _presentTimesLabel = [[UILabel alloc] initWithFrame:CGRectMake(_titleLabel.frame.origin.x, _titleLabel.frame.origin.y + _titleLabel.bounds.size.height, kWidth / 3, _iconImageView.bounds.size.height / 2)];
        _presentTimesLabel.textColor = [UIColor whiteColor];
        _presentTimesLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_presentTimesLabel];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
