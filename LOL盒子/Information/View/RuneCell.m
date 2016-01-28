//
//  RuneCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RuneCell.h"
#import "UIImageView+WebCache.h"
#import "RuneModel.h"

@interface RuneCell ()

@property (nonatomic, strong) UIImageView *runeImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *firstLabel;
@property (nonatomic, strong) UILabel *secondLabel;
@property (nonatomic, strong) UILabel *thirdLabel;
@end

@implementation RuneCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _runeImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_runeImageView];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_nameLabel];
        
        _firstLabel = [[UILabel alloc] init];
        _firstLabel.textColor = [UIColor whiteColor];
        _firstLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_firstLabel];
        
        _secondLabel = [[UILabel alloc] init];
        _secondLabel.textColor = [UIColor whiteColor];
        _secondLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_secondLabel];

        _thirdLabel = [[UILabel alloc] init];
        _thirdLabel.textColor = [UIColor whiteColor];
        _thirdLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_thirdLabel];

        self.backgroundColor = [UIColor blackColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    _runeImageView.frame = CGRectMake(5, 10, kWidth / 5, kWidth / 4.5);
    _nameLabel.frame = CGRectMake(_runeImageView.frame.origin.x + _runeImageView.bounds.size.width + 5, _runeImageView.frame.origin.y, kWidth - _nameLabel.frame.origin.x, _runeImageView.frame.size.height / 4);
    _firstLabel.frame = CGRectMake(_nameLabel.frame.origin.x, _nameLabel.frame.origin.y + _nameLabel.frame.size.height, _nameLabel.bounds.size.width, _nameLabel.bounds.size.height);
    _secondLabel.frame = CGRectMake(_firstLabel.frame.origin.x, _firstLabel.frame.origin.y + _firstLabel.frame.size.height, _firstLabel.bounds.size.width, _firstLabel.bounds.size.height);
    _thirdLabel.frame = CGRectMake(_secondLabel.frame.origin.x, _secondLabel.frame.origin.y + _secondLabel.frame.size.height, _secondLabel.bounds.size.width, _secondLabel.bounds.size.height);
}

- (void)setRune:(RuneModel *)rune {
    
    if (_rune != rune) {
        _rune = rune;
        
        [_runeImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/runes/%@_3.png", _rune.Img]] placeholderImage:nil];
        _nameLabel.text = _rune.Name;
        _firstLabel.text = [NSString stringWithFormat:@"一级:%@%@", _rune.Prop, _rune.lev1];
        _secondLabel.text = [NSString stringWithFormat:@"二级:%@%@", _rune.Prop, _rune.lev2];
        _thirdLabel.text = [NSString stringWithFormat:@"三级:%@%@", _rune.Prop, _rune.lev3];
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
