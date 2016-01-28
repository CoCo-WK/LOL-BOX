//
//  SelectHeroViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "SelectHeroViewController.h"
#import "AllHeroView.h"
#import "FreeHeroView.h"
#import "SearchView.h"
#import "HeroDetailModel.h"
#import "HeroModel.h"
#import "NetHandler.h"

@interface SelectHeroViewController ()<UICollectionViewDelegate>

@property (nonatomic, strong) AllHeroView *allHeroView; // 所有英雄视图
@property (nonatomic, strong) NSMutableArray *allHeroArr; // 所有英雄容器
@property (nonatomic, strong) NSMutableArray *searchHeroArr; // 搜索结果容器
@property (nonatomic, assign) BOOL isSearch; // 表示搜索状态

@end

@implementation SelectHeroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 网络请求
    [self requireAllHeroDataWithURL];
    // 添加所有英雄视图
    self.allHeroView = [[AllHeroView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7, kViewWidth, kViewHeight / 7 * 6)];
    [self.view addSubview:self.allHeroView];
    // 设置代理属性
    self.allHeroView.freeHeroView.collectionView.delegate = self;
    
    // 定义BOOL初始值
    _isSearch = YES;
    // 添加搜索框按钮方法
    [self.allHeroView.searchView.searchButton addTarget:self action:@selector(doTapSearchButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.allHeroView.searchView.searchTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
}
//  搜索按钮方法
- (void)doTapSearchButton:(UIButton *)button {
    
    [_allHeroView endEditing:YES];
    
    if (_isSearch == NO) {
        
        _allHeroView.heroArr = self.allHeroArr;
        _allHeroView.searchView.searchTF.text = @"";
        [_allHeroView.searchView.searchButton setTitle:@"搜索" forState:UIControlStateNormal];
        _isSearch = YES;
    }
}

//  textField的target—action方法
- (void)textFieldDidChange:(UITextField *)textField {
    
    //    NSLog(@"%@", textField.text);
    
    _searchHeroArr = [NSMutableArray arrayWithCapacity:0];
    [_allHeroView.searchView.searchButton setTitle:@"取消" forState:UIControlStateNormal];
    _isSearch = NO;
    
    if ([textField.text isEqual:@""]) {
        
        _allHeroView.heroArr = self.allHeroArr;
    }  else {
        for (HeroModel *hero in self.allHeroArr) {
            if ([hero.title containsString:textField.text] || [hero.enName containsString:textField.text] || [hero.cnName containsString:textField.text] || [hero.location containsString:textField.text] || [hero.enName containsString:textField.text]) {
                
                [_searchHeroArr addObject:hero];
            }
        }
        _allHeroView.heroArr = _searchHeroArr;
    }
}

//  点击collectionView方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // 回收键盘
    [self.view endEditing:YES];
    // 属性传值
    if ([self.searchHeroArr count] != 0) {
        HeroDetailModel *heroDetail = [[HeroDetailModel alloc]initWithHero:self.searchHeroArr[indexPath.item]];
        [self getHeroDetailDataWithHeroName:heroDetail.hero.enName withHeroDetail:heroDetail];
    } else {
        HeroDetailModel *heroDetail = [[HeroDetailModel alloc]initWithHero:self.allHeroArr[indexPath.item]];
        [self getHeroDetailDataWithHeroName:heroDetail.hero.enName withHeroDetail:heroDetail];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
//  网络请求，获取全部英雄数据
- (void)requireAllHeroDataWithURL {
    
    [NetHandler getDataWithUrl:kAllHeroURL completion:^(NSData *data) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSArray *arr = dict[@"all"];
        self.allHeroArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in arr) {
            HeroModel *hero = [[HeroModel alloc] init];
            [hero setValuesForKeysWithDictionary:dic];
            [self.allHeroArr addObject:hero];
        }
        _allHeroView.heroArr = self.allHeroArr;
    }];
}

//  网络请求 获取英雄详细数据
-(void)getHeroDetailDataWithHeroName:(NSString *)name withHeroDetail:(HeroDetailModel *)heroDetail {
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiHeroDetail.php?heroName=%@", name] completion:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        [heroDetail setValuesForKeysWithDictionary:dic];
        //给view的model赋值
        //里面执行block  实现传值
        self.heroBlock(heroDetail);
    }];
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
