//
//  BestTeamDetailViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "BestTeamDetailViewController.h"
#import "BestTeamModel.h"
#import "UIImageView+WebCache.h"
#import "BestTeamCell.h"
#import "BestTeamDetailCell.h"

@interface BestTeamDetailViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView; // 表视图

@end

@implementation BestTeamDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7, kViewWidth, kViewHeight / 7 * 6) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];

}

- (void)setBestTeam:(BestTeamModel *)bestTeam {
    
    if (_bestTeam != bestTeam) {
        _bestTeam = bestTeam;
        [self.tableView reloadData];
    }
}

#pragma mark - UITableViewDataSource 与 UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        BestTeamCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
        if (!cell) {
            cell = [[BestTeamCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuse"];
        }
        [cell setBestTeam:self.bestTeam];
        cell.str = @"beginFit";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        
        BestTeamDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse1"];
        if (!cell) {
            cell = [[BestTeamDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse1"];
        }
        [cell setBestTeam:self.bestTeam atIndexPathRow:indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    if (indexPath.section == 0) {
        CGRect bounds = [self.bestTeam.des boundingRectWithSize:CGSizeMake(kViewWidth - 20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        return 10 + self.view.bounds.size.width / 6 + 20 + 10 + bounds.size.height;
    } else {
        NSArray *desArr = @[self.bestTeam.des1, self.bestTeam.des2, self.bestTeam.des3, self.bestTeam.des4, self.bestTeam.des5];
        CGRect bounds = [desArr[indexPath.row] boundingRectWithSize:CGSizeMake(kViewWidth / 6 * 5 - 15, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        return 10 + 10 + bounds.size.height;
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
