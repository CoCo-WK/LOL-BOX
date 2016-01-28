//
//  HeroDetailViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroDetailViewController.h"
#import "HeroDetailTopView.h"
#import "UIColor+AddColor.h"
#import "NetHandler.h"
#import "HeroModel.h"
#import "HeroDetailModel.h"
#import "HeroSkillModel.h"
#import "SkillCell.h"
#import "UIButton+WebCache.h"
#import "PartnerCell.h"
#import "TipsCell.h"
#import "HeroSkinView.h"
#import "HeroDataCell.h"
#import "EquipTableView.h"
#import "HeroEquipModel.h"
#import "HeroSkinModel.h"
#import "HeroTalentViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "HeroCompareViewController.h"

@interface HeroDetailViewController () <UITableViewDelegate, UITableViewDataSource, AVAudioPlayerDelegate>

@property (nonatomic, strong) UITableView *informationTableView; // 英雄信息视图
@property (nonatomic, strong) EquipTableView *equipTableView; // 英雄出装视图
@property (nonatomic, strong) HeroSkinView *heroSkinView; // 英雄皮肤视图
@property (nonatomic, strong) HeroDetailModel *heroDetail;
@property (nonatomic, strong) HeroSkillModel *skillModel;
@property (nonatomic, strong) HeroEquipModel *equipModel;
@property (nonatomic, copy) NSString *str;
@property (nonatomic, strong) NSMutableArray *equipArr; // 装备数组容器
@property (nonatomic ,strong) NSMutableArray *skinArr; // 皮肤数组容器
@property(nonatomic, strong)AVAudioPlayer *avAudioPlayer;   //播放器player
@end

@implementation HeroDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 网络请求获取英雄数据
    [self requireHeroDataWithURL];
    [self requireHeroEquipDataWithURL];
    [self requireHeroSkinDataWithURL];
    
    // 最上方的视图
    HeroDetailTopView *heroDetailTV = [[HeroDetailTopView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7, kViewWidth, kViewHeight / 7)];
    [self.view addSubview:heroDetailTV];
    // 传值
    heroDetailTV.hero = self.hero;
    // 添加按钮方法
    [heroDetailTV.compareButton addTarget:self action:@selector(dpTapCompareButton:) forControlEvents:UIControlEventTouchUpInside];
    [heroDetailTV.talentButton addTarget:self action:@selector(doTapTalentButton:) forControlEvents:UIControlEventTouchUpInside];
    [heroDetailTV.playButton addTarget:self action:@selector(doTapPlayButton:) forControlEvents:UIControlEventTouchUpInside];
    
    // 添加UISegmentedControl到父视图
    [self addSegmentedControl];
    
    // 英雄信息视图
    _informationTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kViewHeight / 7 * 2 + 30, kViewWidth, kViewHeight / 7 * 5 - 30) style:UITableViewStylePlain];
    _informationTableView.backgroundColor = [UIColor blackColor];
    _informationTableView.delegate = self;
    _informationTableView.dataSource = self;
    _informationTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_informationTableView];
    
    // 英雄出装视图
    _equipTableView = [[EquipTableView alloc] initWithFrame:_informationTableView.frame style:UITableViewStylePlain];
    [self.view addSubview:_equipTableView];
    
    // 英雄皮肤视图
    _heroSkinView = [[HeroSkinView alloc] initWithFrame:_informationTableView.frame];
    _heroSkinView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_heroSkinView];
    
    // 把英雄信息界面放在最上面
    [self.view bringSubviewToFront:_informationTableView];
    
    // 设置tag值
    _informationTableView.tag = 2000;
    _equipTableView.tag = 2001;
    _heroSkinView.tag = 2002;
    
}

//  实现英雄对比按钮方法
- (void)dpTapCompareButton:(UIButton *)button {
   
    HeroCompareViewController *heroCompareVC = [[HeroCompareViewController alloc] init];
    heroCompareVC.heroDetail = self.heroDetail;
    [self.navigationController pushViewController:heroCompareVC animated:YES];
    
}

//  实现天赋符文按钮方法
- (void)doTapTalentButton:(UIButton *)button {
    
    HeroTalentViewController *talentVC = [[HeroTalentViewController alloc] init];
    // 传值
    talentVC.hero = self.hero;
    [self.navigationController pushViewController:talentVC animated:YES];
}

//  实现点击播放声音的按钮
- (void)doTapPlayButton:(UIButton *)button {
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://box.dwstatic.com/sounds/%@/%@.mp3", self.hero.enName, self.hero.enName] completion:^(NSData *data) {
    
        NSError *error = nil;
        self.avAudioPlayer = [[AVAudioPlayer alloc] initWithData:data error:&error];
        if (error == nil) {
            //预播放
            [self.avAudioPlayer prepareToPlay];
            [self.avAudioPlayer play];
        }
    }];
}

//  网络请求 获取英雄详细数据
- (void)requireHeroDataWithURL {
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiHeroDetail.php?heroName=%@", _hero.enName] completion:^(NSData *data) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        _heroDetail = [[HeroDetailModel alloc] initWithHero:_hero];
        [_heroDetail setValuesForKeysWithDictionary:dict];
        
        _skillModel = _heroDetail.skill_B;
        _str = @"B";
        [_informationTableView reloadData];
    }];
    
}

//  网络请求获取英雄出装
- (void)requireHeroEquipDataWithURL {
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://db.duowan.com/lolcz/img/ku11/api/lolcz.php?championName=%@&limit=7", _hero.enName] completion:^(NSData *data) {
        
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        _equipArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in arr) {
            _equipModel = [[HeroEquipModel alloc] init];
            [_equipModel setValuesForKeysWithDictionary:dic];
            [_equipArr addObject:_equipModel];
        }
        _equipTableView.equipArr = _equipArr;
    }];
}

//  网络请求获取英雄皮肤
- (void)requireHeroSkinDataWithURL {
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://box.dwstatic.com/apiHeroSkin.php?hero=%@", _hero.enName] completion:^(NSData *data) {
        
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        _skinArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in arr) {
            
            HeroSkinModel *skinModel = [[HeroSkinModel alloc] init];
            [skinModel setValuesForKeysWithDictionary:dic];
            [_skinArr addObject:skinModel];
        }
        _heroSkinView.skinArr = _skinArr;
    }];
}


#pragma mark - UITableViewDataSource 和 UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 7;
}

//  返回tableView总共有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

//  返回每个Cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch(indexPath.section) {
        case 0: {
            
            SkillCell *cell = [tableView dequeueReusableCellWithIdentifier:@"skillCell"];
            if (!cell) {
                
                cell = [[SkillCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"skillCell"];
            }
            
            [cell.buttonB sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_B_64x64.png", self.hero.enName]] forState:UIControlStateNormal placeholderImage:nil];
            
            [cell.buttonQ sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_Q_64x64.png", self.hero.enName]] forState:UIControlStateNormal placeholderImage:nil];
            
            [cell.buttonW sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_W_64x64.png", self.hero.enName]] forState:UIControlStateNormal placeholderImage:nil];
            
            [cell.buttonE sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_E_64x64.png", self.hero.enName]] forState:UIControlStateNormal placeholderImage:nil];
            
            [cell.buttonR sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_R_64x64.png", self.hero.enName]] forState:UIControlStateNormal placeholderImage:nil];
            
            // 给button添加方法
            [cell.buttonB addTarget:self action:@selector(changeSkill:) forControlEvents:UIControlEventTouchUpInside];
            [cell.buttonQ addTarget:self action:@selector(changeSkill:) forControlEvents:UIControlEventTouchUpInside];
            [cell.buttonW addTarget:self action:@selector(changeSkill:) forControlEvents:UIControlEventTouchUpInside];
            [cell.buttonE addTarget:self action:@selector(changeSkill:) forControlEvents:UIControlEventTouchUpInside];
            [cell.buttonR addTarget:self action:@selector(changeSkill:) forControlEvents:UIControlEventTouchUpInside];
            cell.skillModel = _skillModel;
            cell.str = _str;
            return cell;
        }
            break;
            
        case 1:
        case 2:{
            
            PartnerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"partnerCell"];
            if (!cell) {
                cell = [[PartnerCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"partnerCell"];
            }
            if (indexPath.section == 1) {
                
                cell.partnerArr = self.heroDetail.like;
            }
            if (indexPath.section == 2) {
                cell.partnerArr = self.heroDetail.hate;
            }
            return cell;
        }
            break;
        case 3:
        case 4:
        case 6:{
            
            TipsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tipsCell"];
            if (!cell) {
                cell = [[TipsCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"tipsCell"];
            }
            if (indexPath.section == 3) {
                cell.textStr = self.heroDetail.tips;
            }
            if (indexPath.section == 4) {
                cell.textStr = self.heroDetail.opponentTips;
            }
            if (indexPath.section == 6) {
                cell.textStr = self.heroDetail.heroDescription;
            }
            return cell;
        }
            break;
        case 5:{
            
            HeroDataCell *cell = [tableView dequeueReusableCellWithIdentifier:@"heroDataCell"];
            if (!cell) {
                
                cell = [[HeroDataCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"heroDataCell"];
            }
            cell.heroDetail = self.heroDetail;
            
            [cell.slider addTarget:self action:@selector(changeSlider:) forControlEvents:UIControlEventValueChanged];
            return cell;
        }
            break;
            
        default:{
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
            if (!cell) {
                
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
            }
            return cell;
        }
            break;
    }
}

//  返回每行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    if(indexPath.section == 0) {
        
        CGRect bounds = [self.skillModel.skillDescription boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 20 - self.view.frame.size.width / 7, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        
        CGRect bounds1 = [self.skillModel.effect boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 20 - self.view.frame.size.width / 7, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        
        return bounds.size.height + bounds1.size.height + 10 + self.view.frame.size.width / 7 + 10 + 30 + 10 + 3 * (20 + 10);
    } else if (indexPath.section == 1) {
        
        if (self.heroDetail.like.count) {
            
            CGRect bounds = [self.heroDetail.like[0][@"des"] boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 30 - kViewWidth / 6, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
            CGRect bounds1 = [self.heroDetail.like[1][@"des"] boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 30 - kViewWidth / 6, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
            
            CGFloat height = bounds.size.height > kViewWidth / 6 ? bounds.size.height : kViewWidth / 6;
            CGFloat height1 = bounds1.size.height > kViewWidth / 6 ? bounds1.size.height : kViewWidth / 6;
            return height + height1 + 10 * 2 + 20;
        }
        
    } else if (indexPath.section == 2) {
        
        if (self.heroDetail.hate.count) {
            
            CGRect bounds = [self.heroDetail.hate[0][@"des"] boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 30 - kViewWidth / 6, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
            CGRect bounds1 = [self.heroDetail.hate[1][@"des"] boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 30 - kViewWidth / 6, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
            
            CGFloat height = bounds.size.height > kViewWidth / 6 ? bounds.size.height : kViewWidth / 6;
            CGFloat height1 = bounds1.size.height > kViewWidth / 6 ? bounds1.size.height : kViewWidth / 6;
            return height + height1 + 10 * 2 + 20;
        }
    } else if (indexPath.section == 3) {
        
        CGRect bounds = [self.heroDetail.tips boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        return bounds.size.height + 20;
        
    } else if (indexPath.section == 4) {
        
        CGRect bounds = [self.heroDetail.opponentTips boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        return bounds.size.height + 20;
        
    } else if (indexPath.section == 5) {
        
        return 350;
    } else if (indexPath.section == 6) {
        
        CGRect bounds = [self.heroDetail.heroDescription boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        return bounds.size.height + 20;
        
    }
    return 100;
}

//  设置区头标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"欢迎来到英雄联盟";
}

// 设置区头view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, 30)];
    UILabel *headLabel = [[UILabel alloc] initWithFrame:headView.bounds];
    headLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    headLabel.textColor = [UIColor carrotColor];
    NSArray *arr = @[@"  技能说明", @"  最佳搭档", @"  最佳克制", @"  使用技巧", @"  应对技巧", @"  英雄数据", @"  英雄背景"];
    headLabel.text = arr[section];
    headLabel.opaque = NO;
    [headView addSubview:headLabel];
    
    return headView;
}

//  实现技能按钮方法
- (void)changeSkill:(UIButton *)button {
    
    if (button.tag == 3000) {
        
        self.skillModel = self.heroDetail.skill_B;
        self.str = @"B";
        [self.informationTableView reloadData];
    } else if (button.tag == 3001) {
        self.skillModel = self.heroDetail.skill_Q;
        self.str = @"Q";
        [self.informationTableView reloadData];
    } else if (button.tag == 3002) {
        self.skillModel = self.heroDetail.skill_W;
        self.str = @"W";
        [self.informationTableView reloadData];
    } else if (button.tag == 3003) {
        self.skillModel = self.heroDetail.skill_E;
        self.str = @"E";
        [self.informationTableView reloadData];
    } else if (button.tag == 3004) {
        self.skillModel = self.heroDetail.skill_R;
        self.str = @"R";
        [self.informationTableView reloadData];
    }
    
}


//  实现滑块的方法
- (void)changeSlider:(UISlider *)slider {
    
    HeroDataCell *cell = [self.informationTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:5]];
    cell.value = slider.value;
    [self.informationTableView reloadData];
}

//  实现添加UISegmentedControl方法
- (void)addSegmentedControl {
    
    // 创建segmentedControl 并设置属性
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"资料", @"出装", @"皮肤"]];
    segmentedControl.frame = CGRectMake(0, kViewHeight / 7 * 2, kViewWidth, 30);
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.tintColor = [UIColor carrotColor];
    [segmentedControl addTarget:self action:@selector(changeSegmentedAction:) forControlEvents:UIControlEventValueChanged];
    // 添加到父视图上
    [self.view addSubview:segmentedControl];
}

//  点击segment方法
- (void)changeSegmentedAction:(UISegmentedControl *)segment {
    
    UIView *view = [self.view viewWithTag:segment.selectedSegmentIndex + 2000];
    [self.view bringSubviewToFront:view];
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
