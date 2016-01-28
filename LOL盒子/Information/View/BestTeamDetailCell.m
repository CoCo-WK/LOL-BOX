//
//  BestTeamDetailCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "BestTeamDetailCell.h"
#import "BestTeamModel.h"
#import "UIImageView+WebCache.h"

@interface BestTeamDetailCell ()

@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIImageView *heroImageView;

@end

@implementation BestTeamDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textColor = [UIColor whiteColor];
        _detailLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_detailLabel];
        
        _heroImageView = [[UIImageView alloc] init];
        [self addSubview:_heroImageView];
        
        self.backgroundColor = [UIColor blackColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    _heroImageView.frame = CGRectMake(10, 10, kWidth / 6, kWidth / 6);

    _detailLabel.frame = CGRectMake(_heroImageView.frame.origin.x + _heroImageView.bounds.size.width + 5, _heroImageView.frame.origin.y, kWidth / 6 * 5 - 25, 100);
    _detailLabel.numberOfLines = 0;
    [_detailLabel sizeToFit];
}

- (void)setBestTeam:(BestTeamModel *)bestTeam atIndexPathRow:(NSInteger)num  {
    
    if (_bestTeam != bestTeam) {
        _bestTeam = bestTeam;
        
        NSArray *heroArr = @[_bestTeam.hero1, _bestTeam.hero2, _bestTeam.hero3, _bestTeam.hero4, _bestTeam.hero5];
        NSArray *detailArr = @[_bestTeam.des1, _bestTeam.des2, _bestTeam.des3, _bestTeam.des4, _bestTeam.des5];
        
        for (int i = 0; i < heroArr.count; i++) {
            
            [_heroImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", heroArr[num]]] placeholderImage:nil];
            _detailLabel.text = detailArr[num];
        }
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
