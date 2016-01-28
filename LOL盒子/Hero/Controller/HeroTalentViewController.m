//
//  HeroTalentViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroTalentViewController.h"
#import "NetHandler.h"
#import "HeroTalentModel.h"
#import "HeroModel.h"
#import "TalentCell.h"
#import "HeroSkinView.h"
#import "TalentImageViewController.h"

@interface HeroTalentViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *heroTalentArr; // 存储英雄天赋的容器
@property (nonatomic, strong) UITableView *talentTableView; // 创建的tableView
@property (nonatomic, strong) HeroTalentModel * heroTalent; // 天赋符文Model
@end

@implementation HeroTalentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 网络请求，获取天赋符文
    [self requireHeroTanlentDataWithURL];
    
    // 创建tableView
    _talentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7, kViewWidth, kViewHeight / 7 * 6) style:UITableViewStylePlain];
    _talentTableView.backgroundColor = [UIColor blackColor];
    _talentTableView.dataSource = self;
    _talentTableView.delegate = self;
    _talentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 注册cell
    [_talentTableView registerClass:[TalentCell class] forCellReuseIdentifier:@"reuse"];
    
    [self.view addSubview:_talentTableView];
}

//  网络请求获取英雄天赋符文数据
- (void)requireHeroTanlentDataWithURL {
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://box.dwstatic.com/apiHeroSuggestedGiftAndRun.php?&hero=%@", self.hero.enName] completion:^(NSData *data) {
        
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        _heroTalentArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in arr) {
            _heroTalent = [[HeroTalentModel alloc] init];
            [_heroTalent setValuesForKeysWithDictionary:dic];
            [_heroTalentArr addObject:_heroTalent];
        }
        [_talentTableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource 与 UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _heroTalentArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TalentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    _heroTalent = _heroTalentArr[indexPath.row];
    [cell setHeroTalent:_heroTalent];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    CGRect bounds = [self.heroTalent.des boundingRectWithSize:CGSizeMake(kViewWidth - 20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return bounds.size.height + 20 + 30 + 20;
}

//  选择cell进行页面跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TalentImageViewController *talentImageVC = [[TalentImageViewController alloc] init];
    self.heroTalent = self.heroTalentArr[indexPath.row];
    talentImageVC.heroTalent = self.heroTalent;
    [self.navigationController pushViewController:talentImageVC animated:YES];
    
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
