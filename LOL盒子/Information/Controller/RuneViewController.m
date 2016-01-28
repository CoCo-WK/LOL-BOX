//
//  RuneViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RuneViewController.h"
#import "NetHandler.h"
#import "RuneModel.h"
#import "RuneCell.h"
#import "UIColor+AddColor.h"

@interface RuneViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *redRuneArr;
@property (nonatomic, strong) NSMutableArray *blueRuneArr;
@property (nonatomic, strong) NSMutableArray *yellowRuneArr;
@property (nonatomic, strong) NSMutableArray *purpleRuneArr;
@property (nonatomic, strong) NSMutableArray *runeArr; // 存储符文的容器
@property (nonatomic, strong) RuneModel *rune;

@property (nonatomic, strong) UIButton *runeButton;
@property (nonatomic, strong) UIView *smallView;
@property (nonatomic, assign) BOOL isTap;
@end

@implementation RuneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // 网络请求
    [self requireRuneDataWithURL];
    // 创建tableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7 + 30, kViewWidth, kViewHeight / 7 * 6 - 30) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.rowHeight = 100;
    [self.view addSubview:self.tableView];
    // 添加headerView
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7, kViewWidth, 30)];
    self.runeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.runeButton.frame = CGRectMake(0, 0, kViewWidth, 30);
    self.runeButton.backgroundColor = [UIColor redColor];
    [self.runeButton setTitle:@"印记" forState:UIControlStateNormal];
    [self.runeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.runeButton addTarget:self action:@selector(doTapRuneButton:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:self.runeButton];
    [self.view addSubview:headerView];
    // 添加小视图，显示按钮
    self.smallView = [[UIView alloc] initWithFrame:CGRectMake(kViewWidth / 3, kViewHeight / 7 + 30, kViewWidth / 3, 120)];
    self.smallView.backgroundColor = [UIColor carrotColor];
    
    UIButton *redButton = [UIButton buttonWithType:UIButtonTypeCustom];
    redButton.frame = CGRectMake(0, 0, self.smallView.frame.size.width, 30);
    [redButton setTitle:@"印记" forState:UIControlStateNormal];
    [redButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [redButton addTarget:self action:@selector(doTapButton:) forControlEvents:UIControlEventTouchUpInside];
    redButton.tag = 7000;
    [self.smallView addSubview:redButton];
    
    UIButton *yellowButton = [UIButton buttonWithType:UIButtonTypeCustom];
    yellowButton.frame = CGRectMake(0, 30, self.smallView.frame.size.width, 30);
    [yellowButton setTitle:@"符印" forState:UIControlStateNormal];
    [yellowButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [yellowButton addTarget:self action:@selector(doTapButton:) forControlEvents:UIControlEventTouchUpInside];
    yellowButton.tag = 7001;
    [self.smallView addSubview:yellowButton];
    
    UIButton *blueButton = [UIButton buttonWithType:UIButtonTypeCustom];
    blueButton.frame = CGRectMake(0, 60, self.smallView.frame.size.width, 30);
    [blueButton setTitle:@"雕纹" forState:UIControlStateNormal];
    [blueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [blueButton addTarget:self action:@selector(doTapButton:) forControlEvents:UIControlEventTouchUpInside];
    blueButton.tag = 7002;
    [self.smallView addSubview:blueButton];
    
    UIButton *purpleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    purpleButton.frame = CGRectMake(0, 90, self.smallView.frame.size.width, 30);
    [purpleButton setTitle:@"精华" forState:UIControlStateNormal];
    [purpleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [purpleButton addTarget:self action:@selector(doTapButton:) forControlEvents:UIControlEventTouchUpInside];
    purpleButton.tag = 7003;
    [self.smallView addSubview:purpleButton];
    
    // 设置BOOL初始值
    self.isTap = YES;
    // 添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doTap:)];
    [self.view addGestureRecognizer:tap];
}

- (void)requireRuneDataWithURL {
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiRunes.php"] completion:^(NSData *data) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSArray *redArr = dict[@"Red"];
        NSArray *blueArr = dict[@"Blue"];
        NSArray *yellowArr = dict[@"Yellow"];
        NSArray *purpleArr = dict[@"Purple"];
        self.redRuneArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in redArr) {
            self.rune = [[RuneModel alloc] init];
            [self.rune setValuesForKeysWithDictionary:dic];
            [self.redRuneArr addObject:self.rune];
        }
        self.runeArr = self.redRuneArr;
        
        self.blueRuneArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in blueArr) {
            self.rune = [[RuneModel alloc] init];
            [self.rune setValuesForKeysWithDictionary:dic];
            [self.blueRuneArr addObject:self.rune];
        }
        self.yellowRuneArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in yellowArr) {
            self.rune = [[RuneModel alloc] init];
            [self.rune setValuesForKeysWithDictionary:dic];
            [self.yellowRuneArr addObject:self.rune];
        }
        self.purpleRuneArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in purpleArr) {
            self.rune = [[RuneModel alloc] init];
            [self.rune setValuesForKeysWithDictionary:dic];
            [self.purpleRuneArr addObject:self.rune];
        }
        
        [self.tableView reloadData];
    }];
    
}

#pragma mark - UITableViewDataSource 与 UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.runeArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RuneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    if (!cell) {
        cell = [[RuneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
    }
    self.rune = self.runeArr[indexPath.row];
    [cell setRune:self.rune];
    return cell;
}

- (void)doTapRuneButton:(UIButton *)button {
    
    if (self.isTap == YES) {
        [self.view addSubview:self.smallView];
        self.isTap = NO;
    } else {
        [self.smallView removeFromSuperview];
        self.isTap = YES;
    }
}

- (void)doTap:(UITapGestureRecognizer *)tap {
    
    [self.smallView removeFromSuperview];
    self.isTap = YES;
}

- (void)doTapButton:(UIButton *)button {
    
    if (button.tag == 7000) {
        self.runeArr = self.redRuneArr;
        [self.runeButton setTitle:@"印记" forState:UIControlStateNormal];
        self.runeButton.backgroundColor = [UIColor redColor];
    } else if(button.tag == 7001) {
        self.runeArr = self.yellowRuneArr;
        [self.runeButton setTitle:@"符印" forState:UIControlStateNormal];
        self.runeButton.backgroundColor = [UIColor yellowColor];
    } else if(button.tag == 7002) {
        self.runeArr = self.blueRuneArr;
        [self.runeButton setTitle:@"雕纹" forState:UIControlStateNormal];
        self.runeButton.backgroundColor = [UIColor blueColor];
    } else {
        self.runeArr = self.purpleRuneArr;
        [self.runeButton setTitle:@"精华" forState:UIControlStateNormal];
        self.runeButton.backgroundColor = [UIColor purpleColor];
    }
    [self.smallView removeFromSuperview];
    self.isTap = YES;
    [self.tableView reloadData];

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
