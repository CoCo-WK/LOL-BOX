//
//  HeroSkillCompareView.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroSkillCompareView.h"
#import "CompareSkillCell.h"
#import "HeroSkillModel.h"
#import "HeroDetailModel.h"
#import "HeroModel.h"

@interface HeroSkillCompareView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *skillModelArr; // 技能model数组
@property (nonatomic, strong) NSMutableArray *owenrSkillModelArr; // 己方技能model数组
@property (nonatomic, strong) NSMutableArray *enemySkillModelArr; // 敌方技能model数组
@property (nonatomic, strong) NSArray *skillTypeNameArr; // 技能类型名字数组
@property (nonatomic, strong) NSMutableArray *maskArr; // 挡板数组

@end

@implementation HeroSkillCompareView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor blackColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];
        
        _skillTypeNameArr = @[@"B", @"Q", @"W", @"E", @"R"];
        // 设置挡板数组
        self.maskArr = [@[@"0", @"0", @"0", @"0", @"0"] mutableCopy];
    }
    return self;
}

#pragma mark - UITableViewDataSource 与 UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CompareSkillCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    if (!cell) {
        cell = [[CompareSkillCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuse"];
    }
    // 为cell的button添加方法
    cell.skillModel = self.skillModelArr[indexPath.row];
    [cell.ownerButton addTarget:self action:@selector(doTapChangeSkill:) forControlEvents:UIControlEventTouchUpInside];
    cell.ownerButton.tag = (indexPath.row + 1) * 6000 + 1;
    
    cell.skillModel = self.skillModelArr[indexPath.row];
    [cell.enemyButton addTarget:self action:@selector(doTapChangeSkill:) forControlEvents:UIControlEventTouchUpInside];
    cell.enemyButton.tag = (indexPath.row + 1) * 6000 + 2;
    
    // 为技能赋上图片
    [cell setHeroOwnerName:self.ownerHeroDetail.hero.enName enemyName:self.enemyHeroDetail.hero.enName skillTypeName:self.skillTypeNameArr[indexPath.row]];
    // 给挡板赋值
    if ([self.maskArr[indexPath.row] isEqualToString:@"0"]) {
        cell.ownerImageView.alpha = 0;
        if (self.enemySkillModelArr.count != 0) {
            
            cell.enemyImageView.alpha = 0.6;
        }
    } else {
        cell.ownerImageView.alpha = 0.6;
        cell.enemyImageView.alpha = 0;
    }
    return cell;
}

//tableview的自适应高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //根据正在展示数组中的数组 自适应高度
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    CGRect rect = [((HeroSkillModel *)self.skillModelArr[indexPath.row]).skillDescription boundingRectWithSize:CGSizeMake(self.frame.size.width - 20 - self.frame.size.width / 7, 10000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    CGRect rect1 = [((HeroSkillModel *)self.skillModelArr[indexPath.row]).effect boundingRectWithSize:CGSizeMake(self.frame.size.width - 20 - self.frame.size.width / 7, 10000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    return 10 + self.frame.size.width / 6 + 10 + 30 +10 + rect.size.height + 3 * (10 + 20) + 10 + rect1.size.height;
}

- (void)doTapChangeSkill:(UIButton *)button {
    
    NSInteger i = button.tag / 6000;
    NSInteger j = button.tag % 6000;
    if (j == 1) {
        [self.skillModelArr replaceObjectAtIndex:i - 1 withObject:self.owenrSkillModelArr[i - 1]];
        [self.maskArr replaceObjectAtIndex:i - 1 withObject:@"0"];
        [self.tableView reloadData];
    } else {
        if (self.enemySkillModelArr.count != 0) {
            
            [self.skillModelArr replaceObjectAtIndex:i - 1 withObject:self.enemySkillModelArr[i - 1]];
            [self.maskArr replaceObjectAtIndex:i - 1 withObject:@"1"];
            
            [self.tableView reloadData];
        }
    }
}

////  实现左边按钮方法
//- (void)doTapLeftButton:(UIButton *)button {
//    
//    NSInteger i = button.tag - 6000;
//    if (self.enemySkillModelArr.count != 0) {
//        [self.maskArr replaceObjectAtIndex:i withObject:@"0"];
//        HeroSkillModel *skill = self.owenrSkillModelArr[i];
//        [self.skillModelArr replaceObjectAtIndex:i withObject:skill];
//    }
//    [self.tableView reloadData];
//}
////  实现右边按钮方法
//- (void)doTapRightButton:(UIButton *)button {
//    
//    NSInteger i = button.tag - 7000;
//    if (self.enemySkillModelArr.count != 0) {
//        [self.maskArr replaceObjectAtIndex:i withObject:@"1"];
//        HeroSkillModel *skill = self.enemySkillModelArr[i];
//        [self.skillModelArr replaceObjectAtIndex:i withObject:skill];
//    }
//    [self.tableView reloadData];
//}
//  重写setter方法
- (void)setOwnerHeroDetail:(HeroDetailModel *)ownerHeroDetail {
    
    if (_ownerHeroDetail != ownerHeroDetail) {
        _ownerHeroDetail = ownerHeroDetail;
        
        self.owenrSkillModelArr = [@[ownerHeroDetail.skill_B, ownerHeroDetail.skill_Q, ownerHeroDetail.skill_W, ownerHeroDetail.skill_E, ownerHeroDetail.skill_R]mutableCopy];
        self.skillModelArr = [@[ownerHeroDetail.skill_B, ownerHeroDetail.skill_Q, ownerHeroDetail.skill_W, ownerHeroDetail.skill_E, ownerHeroDetail.skill_R]mutableCopy];
        // 设置挡板数组
//        self.maskArr = [@[@"0", @"0", @"0", @"0", @"0"] mutableCopy];
        
        [self.tableView reloadData];
    }
}
//  重写setter方法
- (void)setEnemyHeroDetail:(HeroDetailModel *)enemyHeroDetail {
    
    if (_enemyHeroDetail != enemyHeroDetail) {
        _enemyHeroDetail = enemyHeroDetail;
        
        self.enemySkillModelArr = [@[enemyHeroDetail.skill_B, enemyHeroDetail.skill_Q, enemyHeroDetail.skill_W, enemyHeroDetail.skill_E, enemyHeroDetail.skill_R]mutableCopy];
        
        for (int i = 0; i < 5; i++) {
            if ([self.maskArr[i] isEqualToString:@"1"]) {
                HeroSkillModel *skill = self.enemySkillModelArr[i];
                [self.skillModelArr replaceObjectAtIndex:i withObject:skill];
            }
        }
    }
    [self.tableView reloadData];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
