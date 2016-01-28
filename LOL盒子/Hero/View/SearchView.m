//
//  SearchView.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _searchLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth / 10, 5, kWidth / 9, 25)];
        _searchLabel.text = @"搜索:";
        _searchLabel.font = [UIFont systemFontOfSize:15];
        _searchLabel.textColor = [UIColor whiteColor];
        [self addSubview:_searchLabel];
        
        _searchTF = [[UITextField alloc] initWithFrame:CGRectMake(kWidth / 4, 5, kWidth / 2, 25)];
        _searchTF.borderStyle = UITextBorderStyleRoundedRect;
        _searchTF.placeholder = @"请输入英雄关键字";
        _searchTF.font = [UIFont systemFontOfSize:15];
        [self addSubview:_searchTF];
        
        _searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _searchButton.frame = CGRectMake(kWidth / 5 * 4, 5, kWidth / 10, 25);
        [_searchButton setTitle:@"搜索" forState:UIControlStateNormal];
        [self addSubview:_searchButton];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
