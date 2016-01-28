//
//  CompareNameCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "CompareNameCell.h"

@interface CompareNameCell ()
@property (nonatomic, retain)UILabel *ownerNameLabel;
@property (nonatomic, retain)UILabel *enemyNameLabel;
@end

@implementation CompareNameCell
#pragma mark  重写init方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.ownerNameLabel = [[UILabel alloc]init];
        self.enemyNameLabel = [[UILabel alloc]init];
        self.ownerNameLabel.textColor = [UIColor whiteColor];
        self.enemyNameLabel.textColor = [UIColor whiteColor];
        
        
        self.ownerNameLabel.textAlignment = NSTextAlignmentCenter;
        self.enemyNameLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:self.ownerNameLabel];
        [self.contentView addSubview:self.enemyNameLabel];
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}
#pragma mark  重写layoutSubview方法
- (void)layoutSubviews {
    [super layoutSubviews];
    self.ownerNameLabel.frame = CGRectMake(60, 0, 120, 25);
    self.enemyNameLabel.frame = CGRectMake(self.contentView.frame.size.width - 60 - 120, 0, 120, 25);
}
#pragma mark 重写setter方法
- (void)setOwnerName:(NSString *)ownerName {
    if (_ownerName != ownerName) {
        _ownerName = ownerName;
        
        //给内部控件赋值
        self.ownerNameLabel.text = ownerName;
    }
}
- (void)setEnemyName:(NSString *)enemyName {
    if (_enemyName != enemyName) {
        _enemyName = enemyName;
        
        //给内部控件赋值
        self.enemyNameLabel.text = enemyName;
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
