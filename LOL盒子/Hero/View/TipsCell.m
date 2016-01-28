//
//  TipsCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "TipsCell.h"

@interface TipsCell ()

@property (nonatomic, strong) UILabel *tipsLabel;

@end

@implementation TipsCell

//  初始化cell方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _tipsLabel = [[UILabel alloc] init];
        _tipsLabel.textColor = [UIColor whiteColor];
        _tipsLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_tipsLabel];
        self.backgroundColor = [UIColor blackColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    _tipsLabel.frame = CGRectMake(10, 10, kWidth - 20, 100);
    _tipsLabel.numberOfLines = 0;
    
    [_tipsLabel sizeToFit];

}

- (void)setTextStr:(NSString *)textStr {
    if (_textStr != textStr) {
        _textStr = textStr;
        _tipsLabel.text = _textStr;
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
