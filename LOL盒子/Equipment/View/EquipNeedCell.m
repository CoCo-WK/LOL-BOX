//
//  EquipNeedCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipNeedCell.h"
#import "UIImageView+WebCache.h"

@interface EquipNeedCell ()

@property (nonatomic, strong) UIImageView *equipImageView; // 装备图片
@end

@implementation EquipNeedCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
       
        _equipImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self.contentView addSubview:_equipImageView];
    }
    return self;
}

- (void)setEquipmentId:(NSString *)equipmentId {
    
    if (_equipmentId != equipmentId) {
        _equipmentId = equipmentId;
        
        [_equipImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png", _equipmentId]] placeholderImage:nil];
    }
}

@end
