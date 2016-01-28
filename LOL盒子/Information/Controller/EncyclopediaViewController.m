//
//  EncyclopediaViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EncyclopediaViewController.h"
#import "NetHandler.h"
#import "EncyclopediaListModel.h"
#import "UIImageView+WebCache.h"
#import "EquipViewController.h"
#import "TalentViewController.h"
#import "RuneViewController.h"
#import "BestTeamViewController.h"
#import "CommonSkillViewController.h"

@interface EncyclopediaViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView; // 表视图
@property (nonatomic, strong) NSMutableArray *listArr;

@end

@implementation EncyclopediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 网络请求
    [self requireEncyclopediaDataWithURL];
    // 创建tableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7, kViewWidth, kViewHeight / 7 * 6 - 30) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO;
    [self.view addSubview:self.tableView];
}

// 网络请求获取百科列表
- (void)requireEncyclopediaDataWithURL {
    
    [NetHandler getDataWithUrl:@"http://box.dwstatic.com/apiToolMenu.php?category=database&v=70&OSType=iOS8.1.2&versionName=2.1.4" completion:^(NSData *data) {
       
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        self.listArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in arr) {
            EncyclopediaListModel *encyclopediaList = [[EncyclopediaListModel alloc] init];
            [encyclopediaList setValuesForKeysWithDictionary:dic];
            [self.listArr addObject:encyclopediaList];
        }
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource 与 UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuse"];
    }
    cell.backgroundColor = [UIColor blackColor];
    EncyclopediaListModel *encyclopedia = self.listArr[indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:encyclopedia.icon] placeholderImage:[UIImage imageNamed:@"place.jpg"]];
    cell.textLabel.text = encyclopedia.name;
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

//  点击cell进入不同界面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        EquipViewController *equipVC = [[EquipViewController alloc] init];
        [self.navigationController pushViewController:equipVC animated:YES];
    } else if (indexPath.row == 1) {
        TalentViewController *talentVC = [[TalentViewController alloc] init];
        [self.navigationController pushViewController:talentVC animated:YES];
    } else if (indexPath.row == 2) {
        RuneViewController *runeVC = [[RuneViewController alloc] init];
        [self.navigationController pushViewController:runeVC animated:YES];
    } else if (indexPath.row == 3) {
        BestTeamViewController *bestTeamVC = [[BestTeamViewController alloc] init];
        [self.navigationController pushViewController:bestTeamVC animated:YES];
    } else if (indexPath.row == 4) {
        CommonSkillViewController *commonSkillVC = [[CommonSkillViewController alloc] init];
        [self.navigationController pushViewController:commonSkillVC animated:YES];
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
