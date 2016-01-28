//
//  BestTeamViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "BestTeamViewController.h"
#import "NetHandler.h"
#import "BestTeamModel.h"
#import "BestTeamCell.h"
#import "BestTeamDetailViewController.h"

@interface BestTeamViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView; // 表视图
@property (nonatomic, strong) NSMutableArray *bestTeamArr; // 最佳阵容数组

@end

@implementation BestTeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 网络请求数据
    [self requireBestTeamDataWithURL];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7, kViewWidth, kViewHeight / 7 * 6) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 180;
    [self.view addSubview:self.tableView];
}

//  进行网络请求，获取最佳阵容数据
- (void)requireBestTeamDataWithURL {
    
    [NetHandler getDataWithUrl:@"http://box.dwstatic.com/apiHeroBestGroup.php" completion:^(NSData *data) {
        
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        self.bestTeamArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in arr) {
            BestTeamModel *bestTeam = [[BestTeamModel alloc] init];
            [bestTeam setValuesForKeysWithDictionary:dic];
            [self.bestTeamArr addObject:bestTeam];
        }
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource 与 UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.bestTeamArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BestTeamCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    if (!cell) {
        cell = [[BestTeamCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
    }
    BestTeamModel *bestTeam = self.bestTeamArr[indexPath.row];
    [cell setBestTeam:bestTeam];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BestTeamDetailViewController *bestTeamDetailVC = [[BestTeamDetailViewController alloc] init];
    BestTeamModel *bestTeam = self.bestTeamArr[indexPath.row];
    bestTeamDetailVC.bestTeam = bestTeam;
    [self.navigationController pushViewController:bestTeamDetailVC animated:YES];
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
