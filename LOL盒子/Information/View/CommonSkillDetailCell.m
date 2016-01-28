//
//  CommonSkillDetailCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "CommonSkillDetailCell.h"
#import "CommonSkillModel.h"  //model
#import "UIImageView+WebCache.h"
#define KLeft 10
#define KTop 10
#define KH 10
#define  KV 10

@interface CommonSkillDetailCell ()
@property (nonatomic, strong)UIImageView *skillImageView;
@property (nonatomic, strong)UILabel *skillNameLabel;
@property (nonatomic, strong)UILabel *requestLevelLabel;
@property (nonatomic, strong)UILabel *cooldownLabel;
@end

@implementation CommonSkillDetailCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.skillImageView = [[UIImageView alloc]init];
        self.skillNameLabel = [[UILabel alloc]init];
        self.requestLevelLabel = [[UILabel alloc]init];
        self.cooldownLabel = [[UILabel alloc]init];
        
        self.skillNameLabel.textColor = [UIColor whiteColor];
        self.requestLevelLabel.textColor = [UIColor whiteColor];
        self.cooldownLabel.textColor = [UIColor whiteColor];
        
        self.skillNameLabel.font = [UIFont systemFontOfSize:17];
        self.requestLevelLabel.font = [UIFont systemFontOfSize:14];
        self.cooldownLabel.font = [UIFont systemFontOfSize:14];
        
        [self.contentView addSubview:self.skillImageView];
        [self.contentView addSubview:self.skillNameLabel];
        [self.contentView addSubview:self.requestLevelLabel];
        [self.contentView addSubview:self.cooldownLabel];
        
        self.backgroundColor = [UIColor blackColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return  self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    self.skillImageView.frame = CGRectMake(10, 10, self.contentView.bounds.size.width / 4.3, self.contentView.bounds.size.width / 4.3);
    self.skillNameLabel.frame = CGRectMake(self.skillImageView.frame.origin.x + self.skillImageView.frame.size.width + 10, self.skillImageView.frame.origin.y, 100, 30);
    
    self.requestLevelLabel.frame = CGRectMake(self.skillNameLabel.frame.origin.x, self.skillNameLabel.frame.origin.y + self.skillNameLabel.frame.size.height + KV, self.skillNameLabel.frame.size.width, 20);
    
    self.cooldownLabel.frame = CGRectMake(self.requestLevelLabel.frame.origin.x, self.requestLevelLabel.frame.origin.y + self.requestLevelLabel.frame.size.height + 10, self.requestLevelLabel.frame.size.width, 20);
    
}
#pragma mark  setter方法
-(void)setCommonSkill:(CommonSkillModel *)commonSkill {
    if (_commonSkill != commonSkill) {
        _commonSkill = commonSkill;
        
        //给内部空间赋值
        [self.skillImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png", commonSkill.skillId]] placeholderImage:nil];
        self.skillNameLabel.text = commonSkill.name;
        self.requestLevelLabel.text = [NSString stringWithFormat:@"需要等级:%@", commonSkill.level];
        self.cooldownLabel.text = [NSString stringWithFormat:@"冷却时间:%@", commonSkill.cooldown];
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
