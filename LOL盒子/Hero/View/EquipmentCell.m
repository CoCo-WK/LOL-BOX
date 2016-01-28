//
//  EquipmentCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipmentCell.h"
#import "UIColor+AddColor.h"
#import "HeroEquipModel.h"
#import "UIImageView+WebCache.h"

@interface EquipmentCell ()

@property (nonatomic, strong) UILabel *titleLabel; // 标题
@property (nonatomic, strong) UILabel *serverLabel; // 服务器
@property (nonatomic, strong) UILabel *authorLabel; // 作者
@property (nonatomic, strong) UILabel *combatLabel; // 战斗力
@property (nonatomic, strong)UIImageView *firstEquipImageView;  //装备图片
@property (nonatomic, strong)UIImageView *secondEquipImageView;  //装备图片
@property (nonatomic, strong)UIImageView *thirdEquipImageView;  //装备图片
@property (nonatomic, strong)UIImageView *fourthEquipImageView;  //装备图片
@property (nonatomic, strong)UIImageView *fifthEquipImageView;  //装备图片
@property (nonatomic, strong)UIImageView *sixthEquipImageView;  //装备图片

@end

@implementation EquipmentCell

//  初始化cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLabel];
        
        _serverLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_serverLabel];
        
        _authorLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_authorLabel];
        
        _combatLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_combatLabel];
        
        _firstEquipImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_firstEquipImageView];
        
        _secondEquipImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_secondEquipImageView];
        
        _thirdEquipImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_thirdEquipImageView];
        
        _fourthEquipImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_fourthEquipImageView];
        
        _fifthEquipImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_fifthEquipImageView];
        
        _sixthEquipImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_sixthEquipImageView];
        
        self.backgroundColor = [UIColor blackColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

//  设置frame
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _titleLabel.frame = CGRectMake(10, 10, kWidth - 20, 30);
    _titleLabel.textColor = [UIColor carrotColor];
    _titleLabel.font = [UIFont systemFontOfSize:17];
    
    _serverLabel.frame = CGRectMake(_titleLabel.frame.origin.x, _titleLabel.frame.origin.y + _titleLabel.bounds.size.height, kWidth / 5, 20);
    _serverLabel.textColor = [UIColor whiteColor];
    _serverLabel.font = [UIFont systemFontOfSize:15];
    
    _authorLabel.frame = CGRectMake(_serverLabel.frame.size.width + 10, _serverLabel.frame.origin.y, kWidth / 3, 20);
    _authorLabel.textColor = [UIColor whiteColor];
    _authorLabel.font = [UIFont systemFontOfSize:15];
    
    _combatLabel.frame = CGRectMake(_authorLabel.frame.origin.x + _authorLabel.bounds.size.width, _serverLabel.frame.origin.y, _authorLabel.bounds.size.width, 20);
    _combatLabel.textColor = [UIColor whiteColor];
    _combatLabel.font = [UIFont systemFontOfSize:15];
    
    NSArray *arr = @[_firstEquipImageView, _secondEquipImageView, _thirdEquipImageView, _fourthEquipImageView, _fifthEquipImageView, _sixthEquipImageView];
    for (int i = 0; i < arr.count; i++) {
        
        UIImageView *imageView = arr[i];
        imageView.frame = CGRectMake((kWidth / 8 + 15) * i + 10, _serverLabel.frame.origin.y + 25, kWidth / 8, kWidth / 8);
    }
}

- (void)setHeroEquip:(HeroEquipModel *)heroEquip {
    
    if (_heroEquip != heroEquip) {
        
        _heroEquip = heroEquip;
        
        _titleLabel.text = _heroEquip.title;
        _serverLabel.text = _heroEquip.server;
        _authorLabel.text = _heroEquip.author;
        _combatLabel.text = [NSString stringWithFormat:@"战斗力：%@", _heroEquip.combat];
        
        NSArray *equipArr = [_heroEquip.end_cz componentsSeparatedByString:@","];
        
        NSArray *arr = @[_firstEquipImageView, _secondEquipImageView, _thirdEquipImageView, _fourthEquipImageView, _fifthEquipImageView, _sixthEquipImageView];
        for (int i = 0; i < arr.count; i++) {
            // 防止数组越界
            if (equipArr.count > i) {
                UIImageView *imageView = arr[i];
                [imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png", equipArr[i]]] placeholderImage:nil];
            }
            
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
