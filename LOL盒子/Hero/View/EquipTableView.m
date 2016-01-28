//
//  EquipTableView.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipTableView.h"
#import "EquipmentCell.h"

//  英雄出装
@interface EquipTableView () <UITableViewDataSource>

@end

@implementation EquipTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = [UIColor blackColor];
        self.dataSource = self;
        self.rowHeight = 120;
        // 注册cell
        [self registerClass:[EquipmentCell class] forCellReuseIdentifier:@"reuse"];
    }
    return self;
}

- (void)setEquipArr:(NSMutableArray *)equipArr {
    
    if (_equipArr != equipArr) {
        _equipArr = [NSMutableArray arrayWithCapacity:0];
        _equipArr = equipArr;
        [self reloadData];
    }
}

#pragma mark  - UITableViewDataSource 与 UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EquipmentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    HeroEquipModel *heroEquip = _equipArr[indexPath.row];
    [cell setHeroEquip:heroEquip];
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
