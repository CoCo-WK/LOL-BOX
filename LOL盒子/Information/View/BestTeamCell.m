//
//  BestTeamCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "BestTeamCell.h"
#import "BestTeamModel.h"
#import "UIImageView+WebCache.h"

@interface BestTeamCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *heroImageView1;
@property (nonatomic, strong) UIImageView *heroImageView2;
@property (nonatomic, strong) UIImageView *heroImageView3;
@property (nonatomic, strong) UIImageView *heroImageView4;
@property (nonatomic, strong) UIImageView *heroImageView5;

@end

@implementation BestTeamCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_titleLabel];
        
        _heroImageView1 = [[UIImageView alloc] init];
        [self.contentView addSubview:_heroImageView1];
        
        _heroImageView2 = [[UIImageView alloc] init];
        [self.contentView addSubview:_heroImageView2];
        
        _heroImageView3 = [[UIImageView alloc] init];
        [self.contentView addSubview:_heroImageView3];
        
        _heroImageView4 = [[UIImageView alloc] init];
        [self.contentView addSubview:_heroImageView4];
        
        _heroImageView5 = [[UIImageView alloc] init];
        [self.contentView addSubview:_heroImageView5];
        
        _desLabel = [[UILabel alloc] init];
        _desLabel.textColor = [UIColor whiteColor];
        _desLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_desLabel];
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    _titleLabel.frame = CGRectMake(10, 5, kWidth - 20, 20);
    
    NSArray *arr = @[_heroImageView1, _heroImageView2, _heroImageView3, _heroImageView4, _heroImageView5];
    
    for (int i = 0; i < arr.count; i++) {
        
        UIImageView *heroImageView = arr[i];
        heroImageView.frame = CGRectMake(10 + (kWidth / 6 + 10) * i, _titleLabel.frame.origin.y + _titleLabel.bounds.size.height + 5, kWidth / 6, kWidth / 6);
    }
    _desLabel.frame = CGRectMake(10, _heroImageView1.frame.origin.y + _heroImageView1.bounds.size.height + 5, kWidth - 20, kWidth / 5);
    
    if ([_str isEqualToString:@"beginFit"]) {
        [self layoutSubviewsAgain];
    }
}

- (void)layoutSubviewsAgain {
    [_titleLabel sizeToFit];
    [_desLabel sizeToFit];
}

- (void)setBestTeam:(BestTeamModel *)bestTeam {
    
    if (_bestTeam != bestTeam) {
        _bestTeam = bestTeam;
        
        _titleLabel.text = _bestTeam.title;
        _titleLabel.numberOfLines = 0;
        _desLabel.text = _bestTeam.des;
        _desLabel.numberOfLines = 0;
        [_heroImageView1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", _bestTeam.hero1]] placeholderImage:nil];
        [_heroImageView2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", _bestTeam.hero2]] placeholderImage:nil];
        [_heroImageView3 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", _bestTeam.hero3]] placeholderImage:nil];
        [_heroImageView4 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", _bestTeam.hero4]] placeholderImage:nil];
        [_heroImageView5 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", _bestTeam.hero5]] placeholderImage:nil];
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
