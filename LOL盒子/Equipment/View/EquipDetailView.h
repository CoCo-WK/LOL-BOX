//
//  EquipDetailView.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EquipmentDetail;

@interface EquipDetailView : UIView

@property (nonatomic, strong) EquipmentDetail *equipDetail; // 传值
@property (nonatomic, strong) UICollectionView *collectionView; //集合视图
@property (nonatomic, strong) NSArray *needArray; // 需要数组
@property (nonatomic, strong) NSArray *composeArray; // 合成数组
@end