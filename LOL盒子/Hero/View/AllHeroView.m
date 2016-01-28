//
//  AllHeroView.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "AllHeroView.h"
#import "FreeHeroView.h"
#import "HeroCollectionViewCell.h"
#import "HeroModel.h"
#import "SearchView.h"

@interface AllHeroView () <UICollectionViewDataSource>


@end

@implementation AllHeroView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
                
        _freeHeroView = [[FreeHeroView alloc] initWithFrame:CGRectMake(0, 35, kWidth, kHeight - 35)];
        _freeHeroView.collectionView.dataSource = self;
        [self addSubview:_freeHeroView];
        
        _searchView = [[SearchView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 35)];
        _searchView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        [self addSubview:_searchView];
        
    }
    return self;
}

//  重写heroArr的setter方法
- (void)setHeroArr:(NSMutableArray *)heroArr {
    
    if (_heroArr != heroArr) {
        _heroArr = [NSMutableArray arrayWithCapacity:0];
        _heroArr = heroArr;
        [self.freeHeroView.collectionView reloadData];
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
