//
//  CompareSkillCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "CompareSkillCell.h"
#import "HeroSkillModel.h"
#import "UIButton+WebCache.h"

@interface CompareSkillCell ()

@property (nonatomic, strong) UILabel *skillTypeLabel; // 技能类型
@property (nonatomic, strong) UILabel *skillNameLabel; // 技能名称
@property (nonatomic, strong) UILabel *descriptionLabel; // 描述
@property (nonatomic, strong) UILabel *costLabel; // 消耗
@property (nonatomic, strong) UILabel *cooldownLabel; // 冷却
@property (nonatomic, strong) UILabel *rangeLabel; // 范围
@property (nonatomic, strong) UILabel *effectLabel; // 效果
@property (nonatomic, strong) UILabel *descriptionDLabel; // 描述详情
@property (nonatomic, strong) UILabel *costDLabel; // 消耗详情
@property (nonatomic, strong) UILabel *cooldownDLabel; // 冷却详情
@property (nonatomic, strong) UILabel *rangeDLabel; // 范围详情
@property (nonatomic, strong) UILabel *effectDLabel; // 效果详情

@end

@implementation CompareSkillCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // button
        _ownerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_ownerButton];
        _enemyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_enemyButton];
        
        // imageView,挡板
        _ownerImageView = [[UIImageView alloc] init];
        _ownerImageView.backgroundColor = [UIColor blackColor];
        _ownerImageView.alpha = 0;
        [self.contentView addSubview:_ownerImageView];
        _enemyImageView = [[UIImageView alloc] init];
        _enemyImageView.backgroundColor = [UIColor blackColor];
        _enemyImageView.alpha = 0;
        [self.contentView addSubview:_enemyImageView];
        
        // label
        _skillTypeLabel = [[UILabel alloc] init];
        _skillTypeLabel.font = [UIFont systemFontOfSize:15];
        _skillTypeLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_skillTypeLabel];

        _skillNameLabel = [[UILabel alloc] init];
        _skillNameLabel.font = [UIFont systemFontOfSize:17];
        _skillNameLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_skillNameLabel];
        
        _descriptionLabel = [[UILabel alloc] init];
        _descriptionLabel.font = [UIFont systemFontOfSize:15];
        _descriptionLabel.textColor = [UIColor whiteColor];
        _descriptionLabel.text = @"描述：";
        [self.contentView addSubview:_descriptionLabel];
        
        _costLabel = [[UILabel alloc] init];
        _costLabel.font = [UIFont systemFontOfSize:15];
        _costLabel.textColor = [UIColor whiteColor];
        _costLabel.text = @"消耗：";
        [self.contentView addSubview:_costLabel];
        
        _cooldownLabel = [[UILabel alloc] init];
        _cooldownLabel.font = [UIFont systemFontOfSize:15];
        _cooldownLabel.textColor = [UIColor whiteColor];
        _cooldownLabel.text = @"冷却：";
        [self.contentView addSubview:_cooldownLabel];
        
        _rangeLabel = [[UILabel alloc] init];
        _rangeLabel.font = [UIFont systemFontOfSize:15];
        _rangeLabel.textColor = [UIColor whiteColor];
        _rangeLabel.text = @"范围：";
        [self.contentView addSubview:_rangeLabel];
        
        _effectLabel = [[UILabel alloc] init];
        _effectLabel.font = [UIFont systemFontOfSize:15];
        _effectLabel.textColor = [UIColor whiteColor];
        _effectLabel.text = @"效果：";
        [self.contentView addSubview:_effectLabel];
        
        _descriptionDLabel = [[UILabel alloc] init];
        _descriptionDLabel.font = [UIFont systemFontOfSize:15];
        _descriptionDLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_descriptionDLabel];
        
        _costDLabel = [[UILabel alloc] init];
        _costDLabel.font = [UIFont systemFontOfSize:15];
        _costDLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_costDLabel];
        
        _cooldownDLabel = [[UILabel alloc] init];
        _cooldownDLabel.font = [UIFont systemFontOfSize:15];
        _cooldownDLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_cooldownDLabel];
        
        _rangeDLabel = [[UILabel alloc] init];
        _rangeDLabel.font = [UIFont systemFontOfSize:15];
        _rangeDLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_rangeDLabel];
        
        _effectDLabel = [[UILabel alloc] init];
        _effectDLabel.font = [UIFont systemFontOfSize:15];
        _effectDLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_effectDLabel];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    //按钮
    self.ownerButton.frame = CGRectMake(100, 10, self.contentView.frame.size.width / 6, self.contentView.frame.size.width / 6);
    
    self.enemyButton.frame = CGRectMake(self.contentView.frame.size.width -100 -  self.ownerImageView.frame.size.width, self.ownerImageView.frame.origin.y, self.ownerImageView.frame.size.width, self.ownerImageView.frame.size.height);
    
    //图片
    self.ownerImageView.frame = self.ownerButton.frame;
    self.enemyImageView.frame = self.enemyButton.frame;
    
    //技能
    self.skillTypeLabel.frame = CGRectMake(20, self.ownerImageView.frame.origin.y + self.ownerImageView.frame.size.height - 20 + 5, 80, 20);
    self.skillNameLabel.frame = CGRectMake(10, self.ownerButton.frame.origin.y + self.ownerButton.frame.size.height + 5, self.contentView.frame.size.width, 30);
    
    //描述对
    self.descriptionLabel.frame = CGRectMake(10, self.skillNameLabel.frame.origin.y + self.skillNameLabel.frame.size.height + 5, self.contentView.bounds.size.width / 7, 20);
    self.descriptionDLabel.frame = CGRectMake(self.descriptionLabel.frame.origin.x + self.descriptionLabel.frame.size.width ,self.descriptionLabel.frame.origin.y, self.contentView.frame.size.width - 20 - self.descriptionLabel.frame.size.width, 100);
    self.descriptionDLabel.numberOfLines = 0;
    [self.descriptionDLabel sizeToFit];
    //消耗对
    self.costLabel.frame = CGRectMake(10, self.descriptionDLabel.frame.origin.y + self.descriptionDLabel.frame.size.height + 5, self.descriptionLabel.frame.size.width, 20);
    self.costDLabel.frame = CGRectMake(self.costLabel.frame.origin.x + self.costLabel.frame.size.width ,self.costLabel.frame.origin.y, self.contentView.bounds.size.width - 20 - self.costLabel.frame.size.width, 20);
    
    //冷却对
    self.cooldownLabel.frame = CGRectMake(10, self.costDLabel.frame.origin.y + self.costDLabel.frame.size.height + 5, self.costLabel.frame.size.width, 20);
    self.cooldownDLabel.frame = CGRectMake(self.cooldownLabel.frame.origin.x + self.cooldownLabel.frame.size.width ,self.cooldownLabel.frame.origin.y, self.contentView.bounds.size.width - 20 - self.cooldownLabel.frame.size.width, 20);
    
    //范围对
    self.rangeLabel.frame = CGRectMake(10, self.cooldownDLabel.frame.origin.y + self.cooldownDLabel.frame.size.height + 5, self.cooldownLabel.frame.size.width, 20);
    self.rangeDLabel.frame = CGRectMake(self.rangeLabel.frame.origin.x + self.rangeLabel.frame.size.width ,self.rangeLabel.frame.origin.y, self.contentView.bounds.size.width - 20 - self.rangeLabel.frame.size.width, 20);
    
    
    //效果对
    self.effectLabel.frame = CGRectMake(10, self.rangeDLabel.frame.origin.y + self.rangeDLabel.frame.size.height + 5, self.rangeLabel.frame.size.width, 20);
    self.effectDLabel.frame = CGRectMake(self.effectLabel.frame.origin.x + self.effectLabel.frame.size.width ,self.effectLabel.frame.origin.y, self.contentView.bounds.size.width - 20 - self.effectLabel.frame.size.width, 100);
    self.effectDLabel.numberOfLines = 0;
    [self.effectDLabel sizeToFit];
    
}

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

- (void)setHeroOwnerName:(NSString *)ownerName enemyName:(NSString *)enemyName skillTypeName:(NSString *)skillTypeName {
    
    if ([skillTypeName isEqualToString:@"B"]) {
        
        _skillTypeLabel.text = @"被动";
    } else {
        _skillTypeLabel.text = skillTypeName;
    }
    [_ownerButton sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_%@_64x64.png", ownerName, skillTypeName]] forState:UIControlStateNormal];
    [_enemyButton sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_%@_64x64.png", enemyName, skillTypeName]] forState:UIControlStateNormal];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
