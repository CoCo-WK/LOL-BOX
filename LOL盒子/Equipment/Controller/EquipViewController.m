//
//  EquipViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipViewController.h"
#import "UIColor+AddColor.h"
#import "NetHandler.h"
#import "Equipment.h"
#import "EquipListViewController.h"

//  装备分类
@interface EquipViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *equipTableView; // 装备分类tableView
@property (nonatomic, strong) Equipment *equipModel; // 装备分类model
@property (nonatomic, strong) NSMutableArray *equipArr; // 装备分类容器
@end

@implementation EquipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置装备tableView
    self.equipTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7, kViewWidth, kViewHeight / 7 * 6) style:UITableViewStylePlain];
    self.equipTableView.backgroundColor = [UIColor blackColor];
    self.equipTableView.dataSource = self;
    self.equipTableView.delegate = self;
//    self.equipTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.equipTableView];

    // 网络请求, 获取装备分类数据
    [self requireEquipDataWithURL];
}

//  网络请求 获取装备分类信息
- (void)requireEquipDataWithURL {
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiZBCategory.php"] completion:^(NSData *data) {
        
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        _equipArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in arr) {
            _equipModel = [[Equipment alloc] init];
            [_equipModel setValuesForKeysWithDictionary:dic];
            [_equipArr addObject:_equipModel];
        }
        [_equipTableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource 与 UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.equipArr.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    _equipModel = self.equipArr[indexPath.row];
    cell.textLabel.text = _equipModel.text;
    cell.textLabel.textColor = [UIColor carrotColor];
    cell.backgroundColor = [UIColor blackColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EquipListViewController *equipListVC = [[EquipListViewController alloc] init];
    // 点击时传值
    self.equipModel = self.equipArr[indexPath.row];
    equipListVC.equipTag = self.equipModel.equipTag;
    [self.navigationController pushViewController:equipListVC animated:YES];
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
