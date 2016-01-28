//
//  EquipListCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipListCell.h"
#import "UIImageView+WebCache.h"
#import "EquipmentList.h"

//  装备列表的cell
@interface EquipListCell ()

@property (nonatomic, strong) UIImageView *equipImageView; // 装备图片
@property (nonatomic, strong) UILabel *textLabel; // 装备名称

@end

@implementation EquipListCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
       
        _equipImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width)];
        [self.contentView addSubview:_equipImageView];
        
        _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.width, frame.size.width, 20)];
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _textLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_textLabel];
    }
    return self;
}

- (void)setEquipList:(EquipmentList *)equipList {
    
    if (_equipList != equipList) {
        
        _equipList = equipList;
        [_equipImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png", _equipList.equipId]] placeholderImage:nil];
        _textLabel.text = _equipList.text;
    }
}

@end
