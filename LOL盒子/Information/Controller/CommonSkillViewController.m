//
//  CommonSkillViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "CommonSkillViewController.h"
#import "NetHandler.h"
#import "CommonSkillModel.h"
#import "CommonSkillCell.h"
#import "CommonSkillDetailViewController.h"

@interface CommonSkillViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *commonSkillCollectionView; // 集合视图
@property (nonatomic, strong) NSMutableArray *commonSkillArr; // 召唤师技能容器
@end

@implementation CommonSkillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self requireCommomSkillDataWithURL];
    // 常见并配置layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kViewWidth / 5, kViewWidth / 5);
    layout.minimumInteritemSpacing = 20;
    layout.minimumLineSpacing = 40;
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    // 创建collectionView
    _commonSkillCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7, kViewWidth, kViewHeight / 7 * 6) collectionViewLayout:layout];
    _commonSkillCollectionView.backgroundColor = [UIColor blackColor];
    _commonSkillCollectionView.dataSource = self;
    _commonSkillCollectionView.delegate = self;
    
    // 注册cell
    [_commonSkillCollectionView registerClass:[CommonSkillCell class] forCellWithReuseIdentifier:@"reuse"];
    
    [self.view addSubview:_commonSkillCollectionView];
}

//  实现网络请求方法
- (void)requireCommomSkillDataWithURL {
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiSumAbility.php"] completion:^(NSData *data) {
        
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        self.commonSkillArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in arr) {
            CommonSkillModel *commonSkill = [[CommonSkillModel alloc] init];
            [commonSkill setValuesForKeysWithDictionary:dic];
            [_commonSkillArr addObject:commonSkill];
        }
        [self.commonSkillCollectionView reloadData];
    }];
}

#pragma mark - UICollectionViewDataSource 与 UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.commonSkillArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CommonSkillCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    CommonSkillModel *commonSkill = self.commonSkillArr[indexPath.item];
    [cell setCommonSkill:commonSkill];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CommonSkillDetailViewController *commonSkillDetailVC = [[CommonSkillDetailViewController alloc] init];
    // 属性传值+++++要传得属性 一定要用indexPath赋值
    CommonSkillModel *commonSkill = self.commonSkillArr[indexPath.item];
    commonSkillDetailVC.commonSkill = commonSkill;
    [self.navigationController pushViewController:commonSkillDetailVC animated:YES];
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
