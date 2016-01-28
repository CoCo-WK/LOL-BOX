//
//  FreeHeroView.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "FreeHeroView.h"
#import "HeroCollectionViewCell.h"
#import "HeroModel.h"

@interface FreeHeroView () <UICollectionViewDataSource>

@end

@implementation FreeHeroView

//  免费英雄视图的初始化方法
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(kWidth / 5 * 2 + 30, kHeight / 8);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 20;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 0);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        // 注册cell
        [_collectionView registerClass:[HeroCollectionViewCell class] forCellWithReuseIdentifier:@"reuse"];
        [self addSubview:_collectionView];
    }
    return self;
}

//  重写heroArr的setter方法
- (void)setHeroArr:(NSMutableArray *)heroArr {
    
    if (_heroArr != heroArr) {
        _heroArr = [NSMutableArray arrayWithCapacity:0];
        _heroArr = heroArr;
        [self.collectionView reloadData];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.heroArr.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HeroCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    HeroModel *hero = self.heroArr[indexPath.item];
    [cell setHero:hero];
    
    return cell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
