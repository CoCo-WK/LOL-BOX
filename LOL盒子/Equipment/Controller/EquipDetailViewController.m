//
//  EquipDetailViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipDetailViewController.h"
#import "EquipDetailView.h"
#import "NetHandler.h"
#import "EquipmentList.h"
#import "EquipmentDetail.h"

@interface EquipDetailViewController () <UICollectionViewDelegate>

@property (nonatomic, strong) EquipDetailView *equipmentDetailView; // 装备详情视图
@property (nonatomic, strong) EquipmentDetail *equipDetail; // 装备详情model

@end

@implementation EquipDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 网络请求，获取装备信息
    [self requireEquipDetailDataWithURL];
    // 创建装备详情视图
    self.equipmentDetailView = [[EquipDetailView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7, kViewWidth, kViewHeight / 7 * 6)];
    self.equipmentDetailView.collectionView.delegate = self;
    [self.view addSubview:self.equipmentDetailView];
}

- (void)requireEquipDetailDataWithURL{
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiItemDetail.php?id=%@", self.equipList.equipId] completion:^(NSData *data) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        self.equipDetail = [[EquipmentDetail alloc] init];
        [self.equipDetail setValuesForKeysWithDictionary:dic];
        self.equipmentDetailView.needArray = nil;
        self.equipmentDetailView.composeArray = nil;
        self.equipmentDetailView.equipDetail = self.equipDetail;
    }];
}

//  实现点击item事件方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        self.equipList.equipId = self.equipmentDetailView.needArray[indexPath.item];
        [self requireEquipDetailDataWithURL];
    } else {
        self.equipList.equipId = self.equipmentDetailView.composeArray[indexPath.item];
        [self requireEquipDetailDataWithURL];
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
