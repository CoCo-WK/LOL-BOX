//
//  MyHeroView.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyHeroView : UIView

@property (nonatomic, strong) NSMutableArray *heroArr; // 用来接收从控制器穿过来的数组
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSString *serverName;

@end
