//
//  HeroDataCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroDataCell.h"
#import "HeroDetailModel.h"
#import "LLView.h"

@interface HeroDataCell ()

@property (nonatomic, strong) LLView *levelLLV; // 等级
@property (nonatomic, strong) LLView *rangeLLV; // 攻击距离
@property (nonatomic, strong) LLView *moveSpeedLLV; // 移动速度
@property (nonatomic, strong) LLView *attackBaseLLV; // 基础攻击
@property (nonatomic, strong) LLView *armorBaseLLV; // 基础防御
@property (nonatomic, strong) LLView *manaBaseLLV; // 基础魔法值
@property (nonatomic, strong) LLView *healthBaseLLV; // 基础生命值
@property (nonatomic, strong) LLView *criticalChanceBaseLLV; // 暴击概率
@property (nonatomic, strong) LLView *manaRegenBaseLLV; // 魔法回复
@property (nonatomic, strong) LLView *healthRegenBaseLLV; // 生命回复
@property (nonatomic, strong) LLView *magicResistBaseLLV; // 魔法抗性

@end

@implementation HeroDataCell

//  初始化英雄数据cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _slider = [[UISlider alloc] init];
        [self.contentView addSubview:_slider];
        
        _levelLLV = [[LLView alloc] init];
        _levelLLV.title = @"等级：";
        [self.contentView addSubview:_levelLLV];
        
        _rangeLLV = [[LLView alloc] init];
        _rangeLLV.title = @"攻击距离：";
        [self.contentView addSubview:_rangeLLV];
        
        _moveSpeedLLV = [[LLView alloc] init];
        _moveSpeedLLV.title = @"移动速度：";
        [self.contentView addSubview:_moveSpeedLLV];
        
        _attackBaseLLV = [[LLView alloc] init];
        _attackBaseLLV.title = @"基础攻击：";
        [self.contentView addSubview:_attackBaseLLV];
        
        _armorBaseLLV = [[LLView alloc] init];
        _armorBaseLLV.title = @"基础防御：";
        [self.contentView addSubview:_armorBaseLLV];
        
        _manaBaseLLV = [[LLView alloc] init];
        _manaBaseLLV.title = @"基础魔法值：";
        [self.contentView addSubview:_manaBaseLLV];
        
        _healthBaseLLV = [[LLView alloc] init];
        _healthBaseLLV.title = @"基础生命值：";
        [self.contentView addSubview:_healthBaseLLV];
        
        _criticalChanceBaseLLV = [[LLView alloc] init];
        _criticalChanceBaseLLV.title = @"暴击概率：";
        [self.contentView addSubview:_criticalChanceBaseLLV];
        
        _manaRegenBaseLLV = [[LLView alloc] init];
        _manaRegenBaseLLV.title = @"魔法回复：";
        [self.contentView addSubview:_manaRegenBaseLLV];
        
        _healthRegenBaseLLV = [[LLView alloc] init];
        _healthRegenBaseLLV.title = @"生命回复：";
        [self.contentView addSubview:_healthRegenBaseLLV];
        
        _magicResistBaseLLV = [[LLView alloc] init];
        _magicResistBaseLLV.title = @"魔法抗性：";
        [self.contentView addSubview:_magicResistBaseLLV];
        
        self.backgroundColor = [UIColor blackColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

//  添加frame
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _slider.frame = CGRectMake(20, 20, kWidth - 40, 30);
    _slider.minimumValue = 1;
    _slider.maximumValue = 18;
    [self.contentView addSubview:_slider];
    
    // 设置各个LLView的位置
    _levelLLV.frame = CGRectMake(_slider.frame.origin.x, _slider.frame.origin.y + _slider.bounds.size.height + 10, _slider.bounds.size.width, 20);
    
    _rangeLLV.frame = CGRectMake(_levelLLV.frame.origin.x, _levelLLV.frame.origin.y + _levelLLV.bounds.size.height + 5, _levelLLV.bounds.size.width, _levelLLV.bounds.size.height);
    
    _moveSpeedLLV.frame = CGRectMake(_rangeLLV.frame.origin.x, _rangeLLV.frame.origin.y + _rangeLLV.bounds.size.height + 5, _rangeLLV.bounds.size.width, _rangeLLV.bounds.size.height);
    
    _attackBaseLLV.frame = CGRectMake(_moveSpeedLLV.frame.origin.x, _moveSpeedLLV.frame.origin.y + _moveSpeedLLV.bounds.size.height + 5, _moveSpeedLLV.bounds.size.width, _moveSpeedLLV.bounds.size.height);
    
    _armorBaseLLV.frame = CGRectMake(_attackBaseLLV.frame.origin.x, _attackBaseLLV.frame.origin.y + _attackBaseLLV.bounds.size.height + 5, _attackBaseLLV.bounds.size.width, _attackBaseLLV.bounds.size.height);
    
    _manaBaseLLV.frame = CGRectMake(_armorBaseLLV.frame.origin.x, _armorBaseLLV.frame.origin.y + _armorBaseLLV.bounds.size.height + 5, _armorBaseLLV.bounds.size.width, _armorBaseLLV.bounds.size.height);
    
    _healthBaseLLV.frame = CGRectMake(_manaBaseLLV.frame.origin.x, _manaBaseLLV.frame.origin.y + _manaBaseLLV.bounds.size.height + 5, _manaBaseLLV.bounds.size.width, _manaBaseLLV.bounds.size.height);
    
    _criticalChanceBaseLLV.frame = CGRectMake(_healthBaseLLV.frame.origin.x, _healthBaseLLV.frame.origin.y + _healthBaseLLV.bounds.size.height + 5, _healthBaseLLV.bounds.size.width, _healthBaseLLV.bounds.size.height);
    
    _manaRegenBaseLLV.frame = CGRectMake(_criticalChanceBaseLLV.frame.origin.x, _criticalChanceBaseLLV.frame.origin.y + _criticalChanceBaseLLV.bounds.size.height + 5, _armorBaseLLV.bounds.size.width, _criticalChanceBaseLLV.bounds.size.height);
    
    _healthRegenBaseLLV.frame = CGRectMake(_manaRegenBaseLLV.frame.origin.x, _manaRegenBaseLLV.frame.origin.y + _manaRegenBaseLLV.bounds.size.height + 5, _manaRegenBaseLLV.bounds.size.width, _manaRegenBaseLLV.bounds.size.height);
    
    _magicResistBaseLLV.frame = CGRectMake(_healthRegenBaseLLV.frame.origin.x, _healthRegenBaseLLV.frame.origin.y + _healthRegenBaseLLV.bounds.size.height + 5, _healthRegenBaseLLV.bounds.size.width, _healthRegenBaseLLV.bounds.size.height);
}

- (void)setHeroDetail:(HeroDetailModel *)heroDetail {
    
    if (_heroDetail != heroDetail ) {
        _heroDetail = heroDetail;
        
        [self setValue:1];
    }
}

- (void)setValue:(NSInteger)value {
    
    if (_value != value) {
        _value= value;
        
        _levelLLV.detail = [NSString stringWithFormat:@"%ld", _value];
        _rangeLLV.detail = [NSString stringWithFormat:@"%.2f", [_heroDetail.range floatValue]];
        _moveSpeedLLV.detail = [NSString stringWithFormat:@"%.2f", [_heroDetail.moveSpeed floatValue]];
        _attackBaseLLV.detail = [NSString stringWithFormat:@"%.2f（+%.2f/每级）", [_heroDetail.attackBase floatValue] + [_heroDetail.attackLevel floatValue] * _value, [_heroDetail.attackLevel floatValue]];
        _armorBaseLLV.detail = [NSString stringWithFormat:@"%.2f（+%.2f/每级）", [_heroDetail.armorBase floatValue] + [_heroDetail.armorLevel floatValue] * _value, [_heroDetail.armorLevel floatValue]];
        _manaBaseLLV.detail = [NSString stringWithFormat:@"%.2f（+%.2f/每级）", [_heroDetail.manaBase floatValue] + [_heroDetail.manaLevel floatValue] * _value, [_heroDetail.manaLevel floatValue]];
        _healthBaseLLV.detail = [NSString stringWithFormat:@"%.2f（+%.2f/每级）", [_heroDetail.healthBase floatValue] + [_heroDetail.healthLevel floatValue] * _value, [_heroDetail.healthLevel floatValue]];
        _criticalChanceBaseLLV.detail = [NSString stringWithFormat:@"%.2f（+%.2f/每级）", [_heroDetail.criticalChanceBase floatValue] + [_heroDetail.criticalChanceLevel floatValue] * _value, [_heroDetail.criticalChanceLevel floatValue]];
        _manaRegenBaseLLV.detail = [NSString stringWithFormat:@"%.2f（+%.2f/每级）", [_heroDetail.manaRegenBase floatValue] + [_heroDetail.manaRegenLevel floatValue] * _value, [_heroDetail.manaRegenLevel floatValue]];
        _healthRegenBaseLLV.detail = [NSString stringWithFormat:@"%.2f（+%.2f/每级）", [_heroDetail.healthRegenBase floatValue] + [_heroDetail.healthRegenLevel floatValue] * _value, [_heroDetail.healthRegenLevel floatValue]];
        _magicResistBaseLLV.detail = [NSString stringWithFormat:@"%.2f（+%.2f/每级）", [_heroDetail.magicResistBase floatValue] + [_heroDetail.magicResistLevel floatValue] * _value, [_heroDetail.magicResistLevel floatValue]];
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
