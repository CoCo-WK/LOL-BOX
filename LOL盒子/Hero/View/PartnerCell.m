//
//  PartnerCell.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "PartnerCell.h"
#import "UIImageView+WebCache.h"

@interface PartnerCell ()

//  搭档1或克制1
@property (nonatomic, strong) UIImageView *partnerImageView1;
@property (nonatomic, strong) UILabel *partnerLabel1;
//  搭档2或克制2
@property (nonatomic, strong) UIImageView *partnerImageView2;
@property (nonatomic, strong) UILabel *partnerLabel2;


@end

@implementation PartnerCell

//  设置初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _partnerImageView1 = [[UIImageView alloc] init];
        [self addSubview:_partnerImageView1];
        
        _partnerImageView2 = [[UIImageView alloc] init];
        [self addSubview:_partnerImageView2];
        
        _partnerLabel1 = [[UILabel alloc] init];
        _partnerLabel1.textColor = [UIColor whiteColor];
        _partnerLabel1.font = [UIFont systemFontOfSize:15];
        [self addSubview:_partnerLabel1];
        
        _partnerLabel2 = [[UILabel alloc] init];
        _partnerLabel2.textColor = [UIColor whiteColor];
        _partnerLabel2.font = [UIFont systemFontOfSize:15];
        [self addSubview:_partnerLabel2];
        
//        _detailButton = [UIButton buttonWithType:UIButtonTypeSystem];
//        [self addSubview:_detailButton];
        
        self.backgroundColor = [UIColor blackColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _partnerImageView1.frame = CGRectMake(10, 10, kWidth / 6, kWidth / 6);
    
    _partnerLabel1.frame = CGRectMake(_partnerImageView1.bounds.size.width + 20, _partnerImageView1.frame.origin.y, kWidth - _partnerImageView1.bounds.size.width - 20, 100);
    _partnerLabel1.numberOfLines = 0;
    [_partnerLabel1 sizeToFit];

    // 判断图片和文字框的高度 哪个大
    CGFloat y = _partnerLabel1.bounds.size.height > _partnerImageView1.bounds.size.height ? _partnerLabel1.bounds.size.height : _partnerImageView1.bounds.size.height;
    
//    _detailButton.frame = CGRectMake(10, _partnerLabel1.frame.origin.y + y + 10, kWidth - 20, 20);
//    [_detailButton setBackgroundColor:[UIColor blackColor]];
//    [_detailButton setTitle:@"查看更多" forState:UIControlStateNormal];
    
    _partnerImageView2.frame = CGRectMake(_partnerImageView1.frame.origin.x, _partnerImageView1.frame.origin.y + y + 20, _partnerImageView1.bounds.size.width, _partnerImageView1.bounds.size.height);
    
    _partnerLabel2.frame = CGRectMake(_partnerLabel1.frame.origin.x, _partnerImageView2.frame.origin.y, _partnerLabel1.bounds.size.width, 100);
    _partnerLabel2.numberOfLines = 0;
    [_partnerLabel2 sizeToFit];
}

- (void)setPartnerArr:(NSArray *)partnerArr {
    
    if (_partnerArr != partnerArr) {
        _partnerArr = partnerArr;
        
        if (_partnerArr.count >= 1) {
            
            [_partnerImageView1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", _partnerArr[0][@"partner"]]]];
            _partnerLabel1.text = _partnerArr[0][@"des"];
        }
        if (_partnerArr.count >= 2) {
            
            [_partnerImageView2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", _partnerArr[1][@"partner"]]]];
            _partnerLabel2.text = _partnerArr[1][@"des"];
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
