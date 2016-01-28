//
//  CommonSkillCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "CommonSkillCell.h"
#import "UIImageView+WebCache.h"
#import "CommonSkillModel.h"

//  装备列表的cell
@interface CommonSkillCell ()

@property (nonatomic, strong) UIImageView *skillImageView; // 技能图片
@property (nonatomic, strong) UILabel *skillLabel; // 技能名称

@end

@implementation CommonSkillCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _skillImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width)];
        [self.contentView addSubview:_skillImageView];
        
        _skillLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.width, frame.size.width, 20)];
        _skillLabel.textColor = [UIColor whiteColor];
        _skillLabel.textAlignment = NSTextAlignmentCenter;
        _skillLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _skillLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_skillLabel];
    }
    return self;
}

- (void)setCommonSkill:(CommonSkillModel *)commonSkill {
    
    if (_commonSkill != commonSkill) {
        
        _commonSkill = commonSkill;
        [_skillImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png", _commonSkill.skillId]] placeholderImage:nil];
        _skillLabel.text = _commonSkill.name;
    }
}

@end
