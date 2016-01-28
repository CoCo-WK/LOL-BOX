//
//  TalentImageViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "TalentImageViewController.h"
#import "HeroTalentViewController.h"
#import "UIImageView+WebCache.h"
#import "HeroTalentModel.h"

@interface TalentImageViewController () <UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIScrollView *scrollView; // 滚动视图
@property (nonatomic, strong) UIButton *backButton; // 返回按钮
@property (nonatomic, strong) UIImageView *runeImageView; // 符文
@property (nonatomic, strong) UIImageView *talentImageView; // 天赋
@property (nonatomic, strong) UILabel *descirptionLabel; // 描述

@end

@implementation TalentImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor  = [UIColor blackColor];
    // 设置返回button
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _backButton.frame = CGRectMake(20, 40, 30, 30);
    [_backButton setImage:[UIImage imageNamed:@"small.png"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(doTapBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
    
    // 设置scrollView
    _scrollView  = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kViewHeight / 3, kViewWidth, kViewHeight / 3)];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(kViewWidth *2, 0);
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    // 设置符文图片
    _runeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, _scrollView.bounds.size.height)];
    [_runeImageView sd_setImageWithURL:[NSURL URLWithString:_heroTalent.fuPic] placeholderImage:nil];
    [_scrollView addSubview:_runeImageView];
    
    // 设置天赋图片
    _talentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kViewWidth, 0, kViewWidth, _scrollView.bounds.size.height)];
    [_talentImageView sd_setImageWithURL:[NSURL URLWithString:_heroTalent.tianPic] placeholderImage:nil];
    [_scrollView addSubview:_talentImageView];
    [self.view addSubview:_scrollView];
    
    // 设置描述Label
    _descirptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, kViewHeight / 7 * 6 - 50, kViewWidth - 20, 100)];
    _descirptionLabel.text = _heroTalent.fuDes;
    _descirptionLabel.textColor = [UIColor whiteColor];
    _descirptionLabel.font = [UIFont systemFontOfSize:15];
    _descirptionLabel.numberOfLines = 0;
    [_descirptionLabel sizeToFit];
    [self.view addSubview:_descirptionLabel];
    
    // 添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doTap:)];
    [self.scrollView addGestureRecognizer:tap];
}

//  scrollView的delegate方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if (_scrollView.contentOffset.x >= 0 && _scrollView.contentOffset.x < kViewWidth) {
        _descirptionLabel.text = _heroTalent.fuDes;
    } else {
        _descirptionLabel.text = _heroTalent.tianDes;
        [_descirptionLabel sizeToFit];
    }
}

//  添加手势方法
- (void)doTap:(UITapGestureRecognizer *)tap {
    
    _descirptionLabel.alpha = !_descirptionLabel.alpha;
}

//  实现返回按钮的方法
- (void)doTapBackButton:(UIButton *)backButton {
    
    [self.navigationController popViewControllerAnimated:YES];
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
