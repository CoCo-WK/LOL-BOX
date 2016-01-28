//
//  CompareDataCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "CompareDataCell.h"

//  属性比较cell
@interface CompareDataCell ()

@property (nonatomic, strong) UILabel *attributeNameLabel; // 属性名称Label
@property (nonatomic, strong) UILabel *ownerAttributeLabel; // 己方属性Label
@property (nonatomic, strong) UILabel *enemyAttributeLabel; // 敌方属性Label

@end

@implementation CompareDataCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _attributeNameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_attributeNameLabel];
        
        _ownerAttributeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_ownerAttributeLabel];
        
        _enemyAttributeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_enemyAttributeLabel];
        
        self.attributeNameLabel.textColor = [UIColor whiteColor];
        self.ownerAttributeLabel.textColor = [UIColor whiteColor];
        self.enemyAttributeLabel.textColor = [UIColor whiteColor];
        
        self.attributeNameLabel.font = [UIFont systemFontOfSize:14];
        self.ownerAttributeLabel.font = [UIFont systemFontOfSize:13];
        self.enemyAttributeLabel.font = [UIFont systemFontOfSize:13];
        
        self.backgroundColor = [UIColor blackColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)layoutSubviews {
    
    _attributeNameLabel.frame = CGRectMake(15, 0, kWidth / 4, self.contentView.frame.size.height);
    self.ownerAttributeLabel.frame = CGRectMake(self.attributeNameLabel.frame.origin.x + self.attributeNameLabel.frame.size.width + 10, 0, (self.contentView.frame.size.width - self.attributeNameLabel.frame.origin.x - self.attributeNameLabel.frame.size.width - 30) / 2, self.contentView.frame.size.height);
    self.enemyAttributeLabel.frame = CGRectMake(self.ownerAttributeLabel.frame.origin.x + self.ownerAttributeLabel.frame.size.width + 10, 0, self.ownerAttributeLabel.frame.size.width, self.contentView.frame.size.height);
    
}

- (void)setAttributeName:(NSString *)attributeName {
    
    if (_attributeName != attributeName) {
        _attributeName = attributeName;
        
        _attributeNameLabel.text = _attributeName;
    }
}

- (void)setOwnerValue:(NSString *)ownerValue {
   
    if (_ownerValue != ownerValue) {
        _ownerValue = ownerValue;
        
        _ownerAttributeLabel.text = _ownerValue;
    }
}

- (void)setEnemyValue:(NSString *)enemyValue {
    
    if (_enemyValue != enemyValue) {
        _enemyValue = enemyValue;
        
        _enemyAttributeLabel.text = _enemyValue;
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
