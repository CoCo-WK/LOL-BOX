//
//  HeroEquipModel.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroEquipModel : NSObject

@property (nonatomic, copy) NSString *record_id; // 记录id
@property (nonatomic, copy) NSString *title;  // 标题
@property (nonatomic, copy) NSString *author;  //作者
@property (nonatomic, copy) NSString *skill;  //技能
@property (nonatomic, copy) NSString *pre_cz;  //前期出装
@property (nonatomic, copy) NSString *pre_explain; // 前期装备说明
@property (nonatomic, copy) NSString *mid_cz;  //中期出装
@property (nonatomic, copy) NSString *mid_explain;  //中期装备说明
@property (nonatomic, copy) NSString *end_cz;  // 后期出装
@property (nonatomic, copy) NSString *end_explain;  //后期出装说明
@property (nonatomic, copy) NSString *nf_cz;   //  逆风出装
@property (nonatomic, copy) NSString *nf_explain;  //逆风装备说明
@property (nonatomic, copy) NSString *cost;   //装备花费的钱
@property (nonatomic, copy) NSString *game_type; //游戏类型
@property (nonatomic, copy) NSString *user_name;  //用户
@property (nonatomic, copy) NSString *server;   //服务器
@property (nonatomic, copy) NSString *combat;   //战斗力
@property (nonatomic, copy) NSString *good;  //赞
@property (nonatomic, copy) NSString *bad;   //踩
@property (nonatomic, copy) NSString *time;  //时间
@property (nonatomic, copy) NSString *en_name;  // 英雄名字
@property (nonatomic, copy) NSString *cn_name;  //中文名字
@property (nonatomic, copy) NSString *cost_nf;
@property (nonatomic, copy) NSString *ni_name;
@property (nonatomic, copy) NSString *tags;    //定位
@property (nonatomic, copy) NSString *sc;

@end
