//
//  CommonSkillDetailViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "CommonSkillDetailViewController.h"
#import "CommonSkillModel.h"
#import "CommonSkillDetailCell.h"

@interface CommonSkillDetailViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CommonSkillDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7, kViewWidth, kViewHeight / 7 *6) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource 与 UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *array = @[@"技能名称", @"描述", @"天赋强化", @"提示"];
    return array[section];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return self.view.bounds.size.width / 4.3 + 30;
    } else {
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
        NSArray *array = @[self.commonSkill.des, self.commonSkill.strong, self.commonSkill.tips];
        CGRect rect = [array[indexPath.section - 1] boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 120, 1000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
        return  rect.size.height < 20 ? 20 : rect.size.height + 20;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        CommonSkillDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommonSkillDetailCell"];
        if (cell == nil) {
            cell = [[CommonSkillDetailCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"CommonSkillDetailCell"];
        }
        cell.commonSkill = self.commonSkill;
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
        }
        NSArray *array = @[self.commonSkill.des, self.commonSkill.strong, self.commonSkill.tips];
        cell.textLabel.text = array[indexPath.section - 1];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.numberOfLines = 0;
        [cell.textLabel sizeToFit];
        cell.backgroundColor = [UIColor blackColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
