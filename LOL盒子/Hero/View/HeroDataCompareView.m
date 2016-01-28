//
//  HeroDataCompareView.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroDataCompareView.h"
#import "HeroDetailModel.h"
#import "UIColor+AddColor.h"
#import "HeroModel.h"
#import "CompareDataCell.h"
#import "CompareNameCell.h"

@interface HeroDataCompareView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView; // 表视图
@property (nonatomic, strong) UISlider *slider; // 滑块
@property (nonatomic, strong) NSMutableArray *attributesArr; // 属性名字数组
@property (nonatomic, strong) NSMutableArray *baseAttributesValueArr; // 初始属性数组
@property (nonatomic, strong) NSMutableArray *changeAttributesValueArr; // 成长值数组
@property (nonatomic, strong) NSMutableArray *enemyBaseAttributesValueArr; //初始属性值数组
@property (nonatomic, strong) NSMutableArray *enemyChangeAttributesValueArr; // 成长值数组
@property (nonatomic, assign) BOOL isOnce;
@end

@implementation HeroDataCompareView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _attributesArr = [@[@"等级:", @"攻:", @"防:", @"法:", @"难:", @"攻击距离:", @"移动速度:", @"基础攻击:", @"基础防御:", @"基础魔法值:", @"基础生命值:", @"暴击概率:", @"魔法恢复:", @"生命回复:"] mutableCopy];
        self.backgroundColor = [UIColor blackColor];
        // 滑块
        _slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 20, kWidth - 40, 30)];
        _slider.minimumValue = 1;
        _slider.maximumValue = 18;
        [_slider addTarget:self action:@selector(changeValueSlider:) forControlEvents:(UIControlEventValueChanged)];
        [self addSubview:_slider];
        
        // 表视图
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.slider.frame.origin.y + self.slider.frame.size.height, frame.size.width, frame.size.height - self.slider.frame.origin.y - self.slider.frame.size.height) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.userInteractionEnabled = NO;
        _tableView.rowHeight = 23;
        _tableView.backgroundColor = [UIColor blackColor];
        _isOnce = YES;
        [self addSubview:_tableView];
        
    }
    return self;
}

#pragma mark - UITableViewDataSource 与 UITableViewDelegate
//  返回有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 15;
}
//  返回每个cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        static NSString *stringCell1 = @"CompareNameCell";
        CompareNameCell *cell = [tableView dequeueReusableCellWithIdentifier:stringCell1];
        if (cell == nil) {
            cell = [[CompareNameCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:stringCell1];
        }
        cell.ownerName = self.heroDetail.hero.title;
        cell.enemyName = self.enemyHeroDetail.hero.title;
        return cell;
    } else {
        //属性名称数组
        static NSString *reuse1 = @"CompareDataCell";
        CompareDataCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse1];
        if (cell == nil) {
            cell = [[CompareDataCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:reuse1];
        }
        //第二列
        [self changeTableViewCell:cell withRowOfIndexPath:indexPath.row value:1];
        
        //第一列赋值
        cell.attributeName = self.attributesArr[indexPath.row - 1];
        return cell;
    }

}

- (void)setHeroDetail:(HeroDetailModel *)heroDetail {
    
    if (_heroDetail != heroDetail) {
        _heroDetail = heroDetail;
        
        NSArray *GFFN = [_heroDetail.hero.rating componentsSeparatedByString:@","];
        //改变cell中的英雄名字值
        CompareNameCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        cell.ownerName = self.heroDetail.hero.title;
        NSInteger i = self.slider.value;
        _baseAttributesValueArr = [@[[NSString stringWithFormat:@"%ld", i], GFFN[0], GFFN[1], GFFN[2], GFFN[3], heroDetail.range, heroDetail.moveSpeed, heroDetail.attackBase, heroDetail.armorBase, heroDetail.manaBase, heroDetail.healthBase, heroDetail.criticalChanceBase, heroDetail.manaRegenBase, heroDetail.healthRegenBase]mutableCopy];
        _changeAttributesValueArr = [@[@"0", @"0", @"0", @"0", @"0", @"0", @"0", heroDetail.attackLevel, heroDetail.armorLevel, heroDetail.manaLevel, heroDetail.healthLevel, heroDetail.criticalChanceLevel, heroDetail.manaRegenLevel, heroDetail.healthRegenLevel]mutableCopy];
        [self changeValueSlider:self.slider];
    }
}

- (void)setEnemyHeroDetail:(HeroDetailModel *)enemyHeroDetail {
    
    if (_enemyHeroDetail != enemyHeroDetail) {
        _enemyHeroDetail = enemyHeroDetail;
        //改变内部控件值
        CompareNameCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        cell.enemyName = self.enemyHeroDetail.hero.title;
        NSInteger i = self.slider.value;
        NSArray *GFFN = [self.enemyHeroDetail.hero.rating componentsSeparatedByString:@","];
        self.enemyBaseAttributesValueArr = [@[[NSString stringWithFormat:@"%ld", (long)i], GFFN[0], GFFN[1], GFFN[2], GFFN[3], enemyHeroDetail.range, enemyHeroDetail.moveSpeed, enemyHeroDetail.attackBase, enemyHeroDetail.armorBase, enemyHeroDetail.manaBase, enemyHeroDetail.healthBase, enemyHeroDetail.criticalChanceBase, enemyHeroDetail.manaRegenBase, enemyHeroDetail.healthRegenBase]mutableCopy];
        
        self.enemyChangeAttributesValueArr = [@[@"0", @"0", @"0", @"0", @"0", @"0", @"0", enemyHeroDetail.attackLevel, enemyHeroDetail.armorLevel, enemyHeroDetail.manaLevel, enemyHeroDetail.healthLevel, enemyHeroDetail.criticalChanceLevel, enemyHeroDetail.manaRegenLevel, enemyHeroDetail.healthRegenLevel]mutableCopy];
        
        [self changeValueSlider:self.slider];
    }
}

- (void)changeValueSlider:(UISlider *)slider {
    
    NSInteger i = slider.value;
    for (int j = 1; j <= 14; j++) {
        CompareDataCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:j inSection:0]];
        [self changeTableViewCell:cell withRowOfIndexPath:j value:i];
        if (self.enemyBaseAttributesValueArr != 0 || self.enemyChangeAttributesValueArr != 0) {
            
            [self changeTableViewCellEnemy:cell withRowOfIndexPath:j value:i];
        }
    }
}

#pragma mark  改变tabelViewCell中己方数值的方法
- (void)changeTableViewCell:(CompareDataCell *)cell withRowOfIndexPath:(NSInteger)row value:(NSInteger)value {
    switch (row) {
        case 1:
            cell.ownerValue = [NSString stringWithFormat:@"%ld", (long)value];
            break;
        case 2:
        case 3:
        case 4:
        case 5:
            cell.ownerValue = [NSString stringWithFormat:@"%d", [self.baseAttributesValueArr[row - 1] intValue]];
            break;
        case 6:
        case 7:
            cell.ownerValue = [NSString stringWithFormat:@"%.1f", [self.baseAttributesValueArr[row - 1] floatValue]];
            break;
        default:
            cell.ownerValue = [NSString stringWithFormat:@"%.2lf (+%.2lf)", [self.baseAttributesValueArr[row - 1] floatValue] + [self.changeAttributesValueArr[row - 1] floatValue] * value , [self.changeAttributesValueArr[row - 1] floatValue]];
            break;
    }
}

#pragma mark  改变tabelViewCell中敌方数值的方法
- (void)changeTableViewCellEnemy:(CompareDataCell *)cell withRowOfIndexPath:(NSInteger)row value:(NSInteger)value {
    switch (row) {
        case 1:
            cell.enemyValue = [NSString stringWithFormat:@"%ld", (long)value];
            break;
        case 2:
        case 3:
        case 4:
        case 5:
            cell.enemyValue = [NSString stringWithFormat:@"%d", [self.enemyBaseAttributesValueArr[row - 1] intValue]];
            break;
        case 6:
        case 7:
            cell.enemyValue = [NSString stringWithFormat:@"%.1f", [self.enemyBaseAttributesValueArr[row - 1] floatValue]];
            break;
        default:
            cell.enemyValue = [NSString stringWithFormat:@"%.2lf (+%.2lf)", [self.enemyBaseAttributesValueArr[row - 1] floatValue] + [self.enemyChangeAttributesValueArr[row - 1] floatValue] * value , [self.enemyChangeAttributesValueArr[row - 1] floatValue]];
            break;
    }

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
