//
//  TalentCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "TalentCell.h"
#import "HeroTalentModel.h"

@interface TalentCell ()

@property (nonatomic, strong) UILabel *tieleLabel; // 标题
@property (nonatomic, strong) UILabel *desLabel; // 描述
@end

@implementation TalentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _tieleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_tieleLabel];
        
        _desLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_desLabel];
        self.backgroundColor = [UIColor blackColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

//  设置cell内部的位置
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _tieleLabel.frame = CGRectMake(10, 20, kWidth - 20, 30);
    _tieleLabel.textColor = [UIColor whiteColor];
    _tieleLabel.font = [UIFont systemFontOfSize:17];
    
    _desLabel.frame = CGRectMake(10, _tieleLabel.frame.origin.y + _tieleLabel.bounds.size.height + 10, _tieleLabel.bounds.size.width, 100);
    _desLabel.textColor = [UIColor whiteColor];
    _desLabel.font = [UIFont systemFontOfSize:15];
    _desLabel.numberOfLines = 0;
    [_desLabel sizeToFit];
    
}

//  重写heroTanlent的setter方法，给cell内部赋值
- (void)setHeroTalent:(HeroTalentModel *)heroTalent {
    if (_heroTalent != heroTalent) {
        _heroTalent = heroTalent;
        
        _tieleLabel.text = _heroTalent.title;
        _desLabel.text = _heroTalent.des;
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
