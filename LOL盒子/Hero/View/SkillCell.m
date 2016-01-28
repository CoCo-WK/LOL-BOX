//
//  SkillCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "SkillCell.h"
#import "HeroSkillModel.h"

@implementation SkillCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 创建按钮
        _buttonB = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_buttonB];
        
        _buttonQ = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_buttonQ];
        
        _buttonW = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_buttonW];
        
        _buttonE = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_buttonE];
        
        _buttonR = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_buttonR];
        
        // 创建挡板
        _imageViewB = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageViewB];
        
        _imageViewQ = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageViewQ];
        
        _imageViewW = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageViewW];
        
        _imageViewE = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageViewE];
        
        _imageViewR = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageViewR];
        
        // 技能名称
        _skillNameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_skillNameLabel];
        
        // 前面定值Label
        _descriptionLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_descriptionLabel];
        
        _costLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_costLabel];
        
        _cooldownLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_cooldownLabel];
        
        _rangeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_rangeLabel];
        
        _effectLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_effectLabel];
        
        // 后面详情Label
        _descriptionDLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_descriptionDLabel];
        
        _costDLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_costDLabel];
        
        _cooldownDLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_cooldownDLabel];
        
        _rangeDLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_rangeDLabel];
        
        _effectDLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_effectDLabel];
        
    }
    self.backgroundColor = [UIColor blackColor]; // 设置cell背景色
    self.selectionStyle = UITableViewCellSelectionStyleNone; // 设置cell不能被选中
    return self;
}

//  重写layoutSubViews
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    // 技能按钮
    _buttonB.frame = CGRectMake(10, 10, kWidth / 7, kWidth / 7);
    _buttonB.tag = 3000;
    
    _buttonQ.frame = CGRectMake(_buttonB.frame.origin.x + kWidth / 7 + 20, _buttonB.frame.origin.y, kWidth / 7, kWidth / 7);
    _buttonQ.tag = 3001;

    _buttonW.frame = CGRectMake(_buttonQ.frame.origin.x + kWidth / 7 + 20, _buttonB.frame.origin.y, kWidth / 7, kWidth / 7);
    _buttonW.tag = 3002;

    _buttonE.frame = CGRectMake(_buttonW.frame.origin.x + kWidth / 7 + 20, _buttonB.frame.origin.y, kWidth / 7, kWidth / 7);
    _buttonE.tag = 3003;

    _buttonR.frame = CGRectMake(_buttonE.frame.origin.x + kWidth / 7 + 20, _buttonB.frame.origin.y, kWidth / 7, kWidth / 7);
    _buttonR.tag = 3004;
    
    // 技能名字
    _skillNameLabel.frame = CGRectMake(_buttonB.frame.origin.x, _buttonB.frame.origin.y + _buttonB.bounds.size.height, kWidth - 20, 30);
    _skillNameLabel.textColor = [UIColor whiteColor];
    _skillNameLabel.font = [UIFont systemFontOfSize:17];
    
    // 描述
    _descriptionLabel.frame = CGRectMake(10, _skillNameLabel.frame.origin.y + _skillNameLabel.bounds.size.height, _buttonB.bounds.size.width, 20);
    
    _descriptionDLabel.frame = CGRectMake(self.descriptionLabel.frame.origin.x + self.descriptionLabel.frame.size.width ,self.descriptionLabel.frame.origin.y, self.contentView.bounds.size.width - 20 - self.descriptionLabel.frame.size.width, 100);
    _descriptionLabel.text = @"描述：";
    _descriptionLabel.textColor = [UIColor whiteColor];
    _descriptionDLabel.textColor = [UIColor whiteColor];
    _descriptionLabel.font = [UIFont systemFontOfSize:15];
    _descriptionDLabel.font = [UIFont systemFontOfSize:15];
    _descriptionDLabel.numberOfLines = 0; // 自动换行
    [_descriptionDLabel sizeToFit]; // 自适应高度
    
    // 消耗
    _costLabel.frame = CGRectMake(10, _descriptionDLabel.frame.origin.y + _descriptionDLabel.bounds.size.height + 10, _descriptionLabel.bounds.size.width, 20);
    
    _costDLabel.frame = CGRectMake(_costLabel.frame.origin.x + _costLabel.frame.size.width ,_costLabel.frame.origin.y, self.contentView.bounds.size.width - 20 - _costLabel.frame.size.width, 100);
    _costLabel.text = @"消耗：";
    _costLabel.textColor = [UIColor whiteColor];
    _costDLabel.textColor = [UIColor whiteColor];
    _costLabel.font = [UIFont systemFontOfSize:15];
    _costDLabel.font = [UIFont systemFontOfSize:15];
    _costDLabel.numberOfLines = 0; // 自动换行
    [_costDLabel sizeToFit]; // 自适应高度

    // 冷却
    _cooldownLabel.frame = CGRectMake(10, _costDLabel.frame.origin.y + _costDLabel.bounds.size.height + 10, _costLabel.bounds.size.width, 20);
    
    _cooldownDLabel.frame = CGRectMake(_cooldownLabel.frame.origin.x + _cooldownLabel.frame.size.width ,_cooldownLabel.frame.origin.y, self.contentView.bounds.size.width - 20 - _cooldownLabel.frame.size.width, 100);
    _cooldownLabel.text = @"冷却：";
    _cooldownLabel.textColor = [UIColor whiteColor];
    _cooldownDLabel.textColor = [UIColor whiteColor];
    _cooldownLabel.font = [UIFont systemFontOfSize:15];
    _cooldownDLabel.font = [UIFont systemFontOfSize:15];
    _cooldownDLabel.numberOfLines = 0; // 自动换行
    [_cooldownDLabel sizeToFit]; // 自适应高度
    
    // 范围
    _rangeLabel.frame = CGRectMake(10, _cooldownDLabel.frame.origin.y + _cooldownDLabel.bounds.size.height + 10, _cooldownLabel.bounds.size.width, 20);
    
    _rangeDLabel.frame = CGRectMake(_rangeLabel.frame.origin.x + _rangeLabel.frame.size.width ,_rangeLabel.frame.origin.y, self.contentView.bounds.size.width - 20 - _rangeLabel.frame.size.width, 100);
    _rangeLabel.text = @"范围：";
    _rangeLabel.textColor = [UIColor whiteColor];
    _rangeDLabel.textColor = [UIColor whiteColor];
    _rangeLabel.font = [UIFont systemFontOfSize:15];
    _rangeDLabel.font = [UIFont systemFontOfSize:15];
    _rangeDLabel.numberOfLines = 0; // 自动换行
    [_rangeDLabel sizeToFit]; // 自适应高度
    
    // 效果
    _effectLabel.frame = CGRectMake(10, _rangeDLabel.frame.origin.y + _rangeDLabel.bounds.size.height + 10, _buttonB.bounds.size.width, 20);
    
    _effectDLabel.frame = CGRectMake(_effectLabel.frame.origin.x + _effectLabel.frame.size.width ,_effectLabel.frame.origin.y, self.contentView.bounds.size.width - 20 - _effectLabel.frame.size.width, 100);
    _effectLabel.text = @"效果：";
    _effectLabel.textColor = [UIColor whiteColor];
    _effectDLabel.textColor = [UIColor whiteColor];
    _effectLabel.font = [UIFont systemFontOfSize:15];
    _effectDLabel.font = [UIFont systemFontOfSize:15];
    _effectDLabel.numberOfLines = 0; // 自动换行
    [_effectDLabel sizeToFit]; // 自适应高度
    
    // 挡板UIView,它的frame是对应button的frame
    _imageViewB.frame = _buttonB.frame;
    _imageViewB.tag = 4000;
    _imageViewB.backgroundColor = [UIColor blackColor];
    
    _imageViewQ.frame = _buttonQ.frame;
    _imageViewQ.tag = 4001;
    _imageViewQ.backgroundColor = [UIColor blackColor];
    
    _imageViewW.frame = _buttonW.frame;
    _imageViewW.tag = 4002;
    _imageViewW.backgroundColor = [UIColor blackColor];
    
    _imageViewE.frame = _buttonE.frame;
    _imageViewE.tag = 4003;
    _imageViewE.backgroundColor = [UIColor blackColor];
    
    _imageViewR.frame = _buttonR.frame;
    _imageViewR.tag = 4004;
    _imageViewR.backgroundColor = [UIColor blackColor];

}

//  当获取的数据为空时，显示为无
- (void)setSkillModel:(HeroSkillModel *)skillModel {
    if (_skillModel != skillModel) {
        _skillModel = skillModel;
        
        if (skillModel.skillDescription.length == 0) {
            self.descriptionDLabel.text = @"无";
        } else {
            self.descriptionDLabel.text = skillModel.skillDescription;
        }
        
        if (skillModel.name.length == 0 ) {
            self.skillNameLabel.text = @"无";
        } else {
            self.skillNameLabel.text = skillModel.name;
        }
        
        if (skillModel.cost.length == 0) {
            self.costDLabel.text = @"无";
        } else {
            self.costDLabel.text = skillModel.cost;
        }
        
        if (skillModel.cooldown.length == 0) {
            self.cooldownDLabel.text = @"无";
        } else {
            self.cooldownDLabel.text = skillModel.cooldown;
        }
        
        if (skillModel.range.length == 0) {
            self.rangeDLabel.text = @"无";
        } else {
            self.rangeDLabel.text = skillModel.range;
        }
        
        if (skillModel.effect.length == 0) {
            self.effectDLabel.text = @"无";
        } else {
            self.effectDLabel.text = skillModel.effect;
        }

    }
}

- (void)setStr:(NSString *)str {
    
    _str = str;
    if ([str isEqualToString:@"B"]) {
        self.imageViewB.alpha = 0;
        self.imageViewQ.alpha = 0.6;
        self.imageViewW.alpha = 0.6;
        self.imageViewE.alpha = 0.6;
        self.imageViewR.alpha = 0.6;
        self.skillNameLabel.text = [NSString stringWithFormat:@"%@(被动)", _skillModel.name];
    }else if ([str isEqualToString:@"Q"]){
        self.imageViewB.alpha = 0.6;
        self.imageViewQ.alpha = 0;
        self.imageViewW.alpha = 0.6;
        self.imageViewE.alpha = 0.6;
        self.imageViewR.alpha = 0.6;
        self.skillNameLabel.text = [NSString stringWithFormat:@"%@(Q)", _skillModel.name];
    }else if ([str isEqualToString:@"W"]){
        self.imageViewB.alpha = 0.6;
        self.imageViewQ.alpha = 0.6;
        self.imageViewW.alpha = 0;
        self.imageViewE.alpha = 0.6;
        self.imageViewR.alpha = 0.6;
        self.skillNameLabel.text = [NSString stringWithFormat:@"%@(W)", _skillModel.name];
    }else if ([str isEqualToString:@"E"]){
        self.imageViewB.alpha = 0.6;
        self.imageViewQ.alpha = 0.6;
        self.imageViewW.alpha = 0.6;
        self.imageViewE.alpha = 0;
        self.imageViewR.alpha = 0.6;
        self.skillNameLabel.text = [NSString stringWithFormat:@"%@(E)", _skillModel.name];
    }else if ([str isEqualToString:@"R"]){
        self.imageViewB.alpha = 0.6;
        self.imageViewQ.alpha = 0.6;
        self.imageViewW.alpha = 0.6;
        self.imageViewE.alpha = 0.6;
        self.imageViewR.alpha = 0;
        self.skillNameLabel.text = [NSString stringWithFormat:@"%@(R)", _skillModel.name];
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
