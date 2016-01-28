//
//  EquipListViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipListViewController.h"
#import "Equipment.h"
#import "EquipListCell.h"
#import "NetHandler.h"
#import "EquipmentList.h"
#import "EquipDetailViewController.h"

@interface EquipListViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *equipListCollectionView; // 创建collectionView
@property (nonatomic, strong) NSMutableArray *equipListArr; // 装备列表的容器
@property (nonatomic, strong) EquipmentList *equipList;

@end

@implementation EquipListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 网络请求 获取装备列表
    [self requireEquipListDataWithURL];
    // 常见并配置layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kViewWidth / 5, kViewWidth / 5);
    layout.minimumInteritemSpacing = 20;
    layout.minimumLineSpacing = 40;
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    // 创建collectionView
    _equipListCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7, kViewWidth, kViewHeight / 7 * 6) collectionViewLayout:layout];
    _equipListCollectionView.backgroundColor = [UIColor blackColor];
    _equipListCollectionView.dataSource = self;
    _equipListCollectionView.delegate = self;
    
    // 注册cell
    [_equipListCollectionView registerClass:[EquipListCell class] forCellWithReuseIdentifier:@"reuse"];
    
    [self.view addSubview:_equipListCollectionView];
}

//  实现网络请求方法
- (void)requireEquipListDataWithURL {
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiZBItemList.php?tag=%@", _equipTag] completion:^(NSData *data) {
        
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        _equipListArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in arr) {
            _equipList = [[EquipmentList alloc] init];
            [_equipList setValuesForKeysWithDictionary:dic];
            [_equipListArr addObject:_equipList];
        }
        [_equipListCollectionView reloadData];
    }];
    
}

#pragma mark - UICollectionViewDataSource 与 UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _equipListArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    EquipListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    _equipList = _equipListArr[indexPath.item];
    [cell setEquipList:_equipList];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    EquipDetailViewController *equipDetailVC = [[EquipDetailViewController alloc] init];
    // 属性传值+++++要传得属性 一定要用indexPath赋值
    self.equipList = self.equipListArr[indexPath.item];
    equipDetailVC.equipList = self.equipList;
    [self.navigationController pushViewController:equipDetailVC animated:YES];
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
