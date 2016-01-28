//
//  EquipDetailView.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipDetailView.h"
#import "EquipmentDetail.h"
#import "UIImageView+WebCache.h"
#import "EquipNeedCell.h"

@interface EquipDetailView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UIImageView *equipImageView; // 装备图标
@property (nonatomic, strong) UILabel *nameLabel; // 装备名称
@property (nonatomic, strong) UILabel *allPriceLabel; // 装备总价格
@property (nonatomic, strong) UILabel *sellPriceLabel; // 装备出售价格
@property (nonatomic, strong) UILabel *priceLabel; // 合成价格
@property (nonatomic, strong) UILabel *equipDesLabel; // 装备描述

@property (nonatomic, strong) UILabel *needLabel;
@property (nonatomic, strong) UILabel *composeLabel;
@end

@implementation EquipDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        NSArray *arr = @[@"需要", @"可以合成"];
        _equipImageView = [[UIImageView alloc] init];
        [self addSubview:_equipImageView];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor whiteColor];
        [self addSubview:_nameLabel];

        _allPriceLabel = [[UILabel alloc] init];
        _allPriceLabel.textColor = [UIColor whiteColor];
        [self addSubview:_allPriceLabel];

        _sellPriceLabel = [[UILabel alloc] init];
        _sellPriceLabel.textColor = [UIColor whiteColor];
        [self addSubview:_sellPriceLabel];
        
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.textColor = [UIColor whiteColor];
        [self addSubview:_priceLabel];

        
        _equipDesLabel = [[UILabel alloc] init];
        _equipDesLabel.textColor= [UIColor whiteColor];
        _equipDesLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_equipDesLabel];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.headerReferenceSize = CGSizeMake(300, 40); // 区头大小
        layout.itemSize = CGSizeMake(50, 50);
        layout.minimumLineSpacing = 20;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        // 注册item
        [_collectionView registerClass:[EquipNeedCell class] forCellWithReuseIdentifier:@"equipNeedCell"];
        // 注册辅助视图
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        _collectionView.backgroundColor = [UIColor blackColor];
        [self addSubview:_collectionView];
        
        _needLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
        _composeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        _needLabel.textColor = [UIColor whiteColor];
        _composeLabel.textColor = [UIColor whiteColor];
        _needLabel.text = arr[0];
        _composeLabel.text = arr[1];
        
        
        self.backgroundColor = [UIColor blackColor];
        
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];

    _equipImageView.frame = CGRectMake(20, 20, kWidth / 4, kWidth / 4);
    
    _nameLabel.frame = CGRectMake(_equipImageView.bounds.size.width + 40, _equipImageView.frame.origin.y, kWidth / 2, _equipImageView.bounds.size.height / 4);
    _allPriceLabel.frame = CGRectMake(_nameLabel.frame.origin.x, _nameLabel.frame.origin.y + _nameLabel.bounds.size.height, _nameLabel.bounds.size.width, _nameLabel.bounds.size.height);
    _sellPriceLabel.frame = CGRectMake(_allPriceLabel.frame.origin.x, _allPriceLabel.frame.origin.y + _allPriceLabel.bounds.size.height, _allPriceLabel.bounds.size.width, _allPriceLabel.bounds.size.height);
    _priceLabel.frame = CGRectMake(_sellPriceLabel.frame.origin.x, _sellPriceLabel.frame.origin.y + _sellPriceLabel.bounds.size.height, _sellPriceLabel.bounds.size.width, _sellPriceLabel.bounds.size.height);
    _equipDesLabel.frame = CGRectMake(_equipImageView.frame.origin.x, _equipImageView.frame.origin.y + _equipImageView.bounds.size.height + 20, kWidth - 30, 100);
    _equipDesLabel.numberOfLines = 0;
    [_equipDesLabel sizeToFit];
    
    self.collectionView.frame = CGRectMake(self.equipDesLabel.frame.origin.x, self.equipDesLabel.frame.origin.y + self.equipDesLabel.frame.size.height + 10, self.frame.size.width - 30, self.frame.size.height - self.equipDesLabel.frame.origin.y - self.equipDesLabel.frame.size.height - 10);
}

- (void)setEquipDetail:(EquipmentDetail *)equipDetail {
    
    if (_equipDetail != equipDetail) {
        
        _equipDetail = equipDetail;
        [_equipImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png", _equipDetail.equipmentId]] placeholderImage:nil];
        _nameLabel.text = [NSString stringWithFormat:@"名称：%@", _equipDetail.name];
        _allPriceLabel.text = [NSString stringWithFormat:@"购买价格：%@", _equipDetail.allPrice];
        _sellPriceLabel.text = [NSString stringWithFormat:@"出售价格：%@", _equipDetail.sellPrice];
        _priceLabel.text = [NSString stringWithFormat:@"合成价格：%@", _equipDetail.price];
        _equipDesLabel.text = [NSString stringWithFormat:@"描述：%@", _equipDetail.equipmentDescription];
        [_equipDesLabel sizeToFit];
        
        if (_equipDetail.need.length != 0) {
            _needArray = [_equipDetail.need componentsSeparatedByString:@","];
        }
        if (_equipDetail.compose.length != 0) {
            _composeArray = [_equipDetail.compose componentsSeparatedByString:@","];
        }
        [_collectionView reloadData];
    }
}

#pragma mark - UICollectionViewDataSource 与 UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
        return _needArray.count;
    } else {
        return _composeArray.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        EquipNeedCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"equipNeedCell" forIndexPath:indexPath];
        cell.equipmentId = self.needArray[indexPath.item];
        return cell;
    } else {
        EquipNeedCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"equipNeedCell" forIndexPath:indexPath];
        cell.equipmentId = self.composeArray[indexPath.item];
        return cell;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            
            [headerView addSubview:_needLabel];
        } else {
            
            [headerView addSubview:_composeLabel];
        }
        return headerView;
    } else
    return nil;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
