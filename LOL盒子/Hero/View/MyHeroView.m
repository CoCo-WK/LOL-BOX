//
//  MyHeroView.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "MyHeroView.h"
#import "NetHandler.h"
#import "MyHeroCell.h"
#import "HeroModel.h"
#import "UIImageView+WebCache.h"

@interface MyHeroView ()<UITableViewDataSource>

@end

@implementation MyHeroView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.rowHeight = 80;
        _tableView.separatorStyle = UITableViewCellSelectionStyleDefault;
        _tableView.backgroundColor = [UIColor blackColor];
        
        // 注册cell
        [_tableView registerClass:[MyHeroCell class] forCellReuseIdentifier:@"reuse"];
        [self addSubview:_tableView];
        
    }
    return self;
}

- (void)setHeroArr:(NSMutableArray *)heroArr {
    
    if (_heroArr != heroArr) {
        _heroArr = [NSMutableArray arrayWithCapacity:0];
        _heroArr = heroArr;
        [self.tableView reloadData];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.heroArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    MyHeroCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    HeroModel *hero = self.heroArr[indexPath.row];
    cell.cnNameLabel.text = hero.cnName;
    cell.titleLabel.text = hero.title;
    if (![hero.presentTimes intValue]) {
        cell.presentTimesLabel.text = @"场次:0";
    } else {
    cell.presentTimesLabel.text = [NSString stringWithFormat:@"场次:%@", hero.presentTimes];
    }
    [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", hero.enName]]];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *string = @"周免英雄每周五更新";
    return string;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
