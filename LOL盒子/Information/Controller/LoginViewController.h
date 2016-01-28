//
//  LoginViewController.h
//  LOL盒子
//
//  Created by 魏海登 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController

@property (nonatomic, assign) BOOL isFrom;
@property (nonatomic, copy) void (^myBlock)(NSString *name, NSString *server);

@end
