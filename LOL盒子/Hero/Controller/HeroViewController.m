//
//  HeroViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroViewController.h"
#import "UIColor+AddColor.h"
#import "FreeHeroView.h"
#import "MyHeroView.h"
#import "AllHeroView.h"
#import "NetHandler.h"
#import "HeroModel.h"
#import "SearchView.h"
#import "HeroDetailViewController.h"
#import "MJRefresh.h"
#import "LoginViewController.h"
#import "FightViewController.h"

@interface HeroViewController ()<UICollectionViewDelegate, UITableViewDelegate>

@property (nonatomic, strong) FreeHeroView *freeHeroView; // 免费英雄视图
@property (nonatomic, strong) MyHeroView *myHeroView; // 我的英雄视图
@property (nonatomic, strong) AllHeroView *allHeroView; // 全部英雄视图
@property (nonatomic, strong) SearchView *searchView; // 搜索框
@property (nonatomic, strong) NSMutableArray *freeHeroArr; // 存储免费英雄的容器
@property (nonatomic, strong) NSMutableArray *myHeroArr; // 存储我的英雄的容器
@property (nonatomic, strong) NSMutableArray *allHeroArr; // 存储全部英雄的容器
@property (nonatomic, strong) NSMutableArray *searchHeroArr; // 存储搜索到的英雄
@property (nonatomic, assign) BOOL isSearch; // 表示搜索状态
@property (nonatomic, copy) NSString *str;
@end

@implementation HeroViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.freeHeroView.collectionView headerBeginRefreshing];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 添加UISegmentedControl
    [self addSegmentedControl];
    
    // 网络请求
    [self requireFreeHeroDataWithURL];
    [self requireAllHeroDataWithURL];
    
    // 为父视图添加子视图
    // 免费英雄
    _freeHeroView = [[FreeHeroView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7 + 30, kViewWidth, kViewHeight / 7 * 6 - 30)];
    _freeHeroView.collectionView.delegate = self;
    [self.view addSubview:_freeHeroView];
    
    // 我的英雄
    _myHeroView = [[MyHeroView alloc] initWithFrame:_freeHeroView.frame];
    _myHeroView.tableView.delegate = self;
    [self.view addSubview:_myHeroView];
    
    // 全部英雄
    _allHeroView = [[AllHeroView alloc] initWithFrame:_freeHeroView.frame];
    _allHeroView.freeHeroView.collectionView.delegate = self;
    [self.view addSubview:_allHeroView];
    
    // 把周免英雄放在最前面
    [self.view bringSubviewToFront:_freeHeroView];
    
    // 设置tag值
    _freeHeroView.tag = 1000;
    _myHeroView.tag = 1001;
    _allHeroView.tag = 1002;
    
    // 定义BOOL初始值
    _isSearch = YES;
    
    // 添加搜索框按钮方法
    [_allHeroView.searchView.searchButton addTarget:self action:@selector(doTapSearchButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_allHeroView.searchView.searchTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

//  网络请求，获取免费英雄数据
- (void)requireFreeHeroDataWithURL {
    
    [NetHandler getDataWithUrl:kFreeHeroURL completion:^(NSData *data) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSArray *arr = dict[@"free"];
        self.freeHeroArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in arr) {
            HeroModel *hero = [[HeroModel alloc] init];
            [hero setValuesForKeysWithDictionary:dic];
            [self.freeHeroArr addObject:hero];
        }
        _freeHeroView.heroArr = self.freeHeroArr;
    }];
    
}
//  网络请求，获取我的英雄数据
- (void)requireMyHeroDataWithName:(NSString *)name serverName:(NSString *)serverName {
    
    self.str = serverName;
    [NetHandler getDataWithUrl:[[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiMyHeroes.php?serverName=%@&target=%@", serverName, name] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] completion:^(NSData *data) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSArray *arr = dict[@"myHeroes"];
        self.myHeroArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in arr) {
            HeroModel *hero = [[HeroModel alloc] init];
            [hero setValuesForKeysWithDictionary:dic];
            [self.myHeroArr addObject:hero];
        }
        if (self.myHeroArr.count != 0) {
            self.myHeroView.heroArr = self.myHeroArr;
            self.myHeroView.serverName = dict[@"serverName"];

            //不为空的时候写入文件
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLogin"];
            [[NSUserDefaults standardUserDefaults] setObject:serverName forKey:@"server"];
            [[NSUserDefaults standardUserDefaults] setObject:name forKey:@"name"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }];
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

//  实现添加UISegmentedControl方法
- (void)addSegmentedControl {
    
    // 创建segmentedControl 并设置属性
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"本周免费", @"我的英雄", @"全部英雄"]];
    segmentedControl.frame = CGRectMake(0, kViewHeight / 7, kViewWidth, 30);
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.tintColor = [UIColor carrotColor];
    [segmentedControl addTarget:self action:@selector(changeSegmentedAction:) forControlEvents:UIControlEventValueChanged];
    // 添加到父视图上
    [self.view addSubview:segmentedControl];
}

//  点击segment方法
- (void)changeSegmentedAction:(UISegmentedControl *)segment {
    
    UIView *view = [self.view viewWithTag:segment.selectedSegmentIndex + 1000];
//    [self.view bringSubviewToFront:view];
    //我的英雄
    if (segment.selectedSegmentIndex != 1) {
        [self.view bringSubviewToFront:view];
    } else {
        BOOL isLogin = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLogin"];
        if (isLogin == YES) {
            if (self.myHeroArr.count == 0 && segment.selectedSegmentIndex == 1) {
                NSString *server = [[NSUserDefaults standardUserDefaults] objectForKey:@"server"];
                NSString *name = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
                [self requireMyHeroDataWithName:name serverName:server];
                [self.view bringSubviewToFront:view];
            } else {
                [self.view bringSubviewToFront:view];
            }
        } else {
            //跳转到绑定页面
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"你还没有绑定账号,是否去绑定账号" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                LoginViewController *loginVC = [[LoginViewController alloc]init];
                loginVC.isFrom = YES;
                [loginVC setMyBlock:^(NSString *name, NSString *server) {
                    [self requireMyHeroDataWithName:name serverName:server];
                    [self.view bringSubviewToFront:view];
                }];
                [self.navigationController pushViewController:loginVC animated:YES];
                
            }];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                [self.view bringSubviewToFront:view];
            }];
            [alert addAction:sure];
            [alert addAction:cancel];
            
            //模态显示
            [self presentViewController:alert animated:YES completion:^{
                
            }];
        }
    }

}
//  点击collectionView方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HeroDetailViewController *heroDetailVC = [[HeroDetailViewController alloc] init];
    // 属性传值
    if (collectionView == _freeHeroView.collectionView) {
        
        HeroModel *hero = self.freeHeroArr[indexPath.item];
        heroDetailVC.hero = hero;
    } else {
        if (_isSearch == YES) {
            
            HeroModel *hero = self.allHeroArr[indexPath.item];
            heroDetailVC.hero = hero;
        } else {
            
            HeroModel *hero = self.searchHeroArr[indexPath.item];
            heroDetailVC.hero = hero;
        }
        
    }
    [self.navigationController pushViewController:heroDetailVC animated:YES];
}

//  点击tableView方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HeroDetailViewController *heroDetailVC = [[HeroDetailViewController alloc] init];
    // 属性传值
    HeroModel *hero = self.myHeroArr[indexPath.row];
    heroDetailVC.hero = hero;
    [self.navigationController pushViewController:heroDetailVC animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, 50)];
    UILabel *headLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, kViewWidth, 20)];
    headLabel.text = [NSString stringWithFormat:@"    英雄资产（%@）",self.str];
    headLabel.textColor = [UIColor whiteColor];
    [view addSubview:headLabel];
    UILabel *headLabel1 =[[UILabel alloc] initWithFrame:CGRectMake(0, 25, kViewWidth, 20)];
    NSInteger sumPrice = 0;
    for (HeroModel *hero in _myHeroArr) {
        NSArray *priceArray = [hero.price componentsSeparatedByString:@","];
        sumPrice += [priceArray[0] intValue];
    }
    headLabel1.text = [NSString stringWithFormat:@"    您总共有%ld个英雄，价值%ld金币", self.myHeroArr.count, sumPrice];
    headLabel1.textColor = [UIColor whiteColor];
    [view addSubview:headLabel1];
    return view;
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
