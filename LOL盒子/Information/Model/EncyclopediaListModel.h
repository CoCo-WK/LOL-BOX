//
//  EncyclopediaListModel.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncyclopediaListModel : NSObject

@property (nonatomic, copy) NSString *name; // 列表名称
@property (nonatomic, copy) NSString *type; // 类型
@property (nonatomic, copy) NSString *tag; // 列表英文名
@property (nonatomic, copy) NSString *icon; // 列表对应图标

@end
