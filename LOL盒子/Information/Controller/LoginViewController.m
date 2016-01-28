//
//  LoginViewController.m
//  LOL盒子
//
//  Created by 魏海登 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "LoginViewController.h"
#import "UIColor+AddColor.h"
#import "NetHandler.h"
#import "ServerModel.h"
#import "FightViewController.h"

@interface LoginViewController ()<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *serverLabel;

@property (nonatomic, strong)NSString *str;

@property (nonatomic, strong)UITextField *nameTF;
@property (nonatomic, strong)UITextField *serverTF;
@property (nonatomic, strong)UIPickerView *pickerView;  //选择视图
@property (nonatomic, strong)UIButton *sureButton;   //确定button
@property (nonatomic, strong)UIButton *cancelButton;   //取消button

@property (nonatomic, strong)NSMutableArray *serverModelArr;  //数据容器

@property (nonatomic, assign)BOOL isOK ;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 网络请求
    [self requireServerDataWithURL];
    // 设置初值
    _isOK = YES;
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, kViewHeight / 3, 100, 30)];
    _nameLabel.text = @"召唤师名称";
    _nameLabel.textColor = [UIColor carrotColor];
    [self.view addSubview:_nameLabel];
    _serverLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, kViewHeight / 3 + 50, 100, 30)];
    _serverLabel.text = @"服务器名称";
    _serverLabel.textColor = [UIColor carrotColor];
    [self.view addSubview:_serverLabel];
    
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kViewHeight / 3 * 2, kViewWidth, kViewHeight / 3)];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    _pickerView.backgroundColor = [UIColor silverColor];
    
    _nameTF = [[UITextField alloc] initWithFrame:CGRectMake(_nameLabel.frame.origin.x + _nameLabel.bounds.size.width + 5, _nameLabel.frame.origin.y, kViewWidth / 3 * 2 - 40, _nameLabel.bounds.size.height)];
    _nameTF.borderStyle = UITextBorderStyleRoundedRect;
    _nameTF.placeholder = @"请输入召唤师名称";
    [self.view addSubview:_nameTF];
    
    _serverTF = [[UITextField alloc] initWithFrame:CGRectMake(_serverLabel.frame.origin.x + _serverLabel.bounds.size.width + 5, _serverLabel.frame.origin.y, kViewWidth / 3 * 2 - 40, _serverLabel.bounds.size.height)];
    _serverTF.delegate = self;
    _serverTF.placeholder = @"请选择服务器";
    _serverTF.borderStyle = UITextBorderStyleRoundedRect;
    _serverTF.inputView = _pickerView;
    [self.view addSubview:_serverTF];
    
    self.sureButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.sureButton.frame = CGRectMake(90, self.serverTF.frame.origin.y + 50 + self.serverTF.frame.size.height, 80, 40);
    [self.sureButton setTitle:@"确定" forState:(UIControlStateNormal)];
    self.sureButton.backgroundColor = [UIColor carrotColor];
    self.sureButton.layer.cornerRadius = 5;
    [self.sureButton addTarget:self action:@selector(sureButton:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.sureButton];
    
    self.cancelButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.cancelButton.frame = CGRectMake(self.sureButton.frame.origin.x + self.sureButton.frame.size.width + 30, self.sureButton.frame.origin.y, 80, 40);
    [self.cancelButton setTitle:@"取消" forState:(UIControlStateNormal)];
    self.cancelButton.backgroundColor = [UIColor carrotColor];
    self.cancelButton.layer.cornerRadius = 5;
    [self.cancelButton addTarget:self action:@selector(cancelButton:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.cancelButton];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (self.isOK == YES) {
        
        ServerModel *server = self.serverModelArr[0];
        self.serverTF.text = server.fn;
        self.str = server.sn;
        self.isOK = NO;
    }
    return YES;
}

#pragma mark - UIPickerViewDataSource 与 UIPickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.serverModelArr.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    ServerModel *server = self.serverModelArr[row];
    return server.fn;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    ServerModel *server = self.serverModelArr[row];
    self.serverTF.text = server.fn;
    self.str = server.sn;
}

- (void)sureButton:(UIButton *)button {
    // 判断服务器名称在已知数组中
    BOOL isContain = NO;
    for (ServerModel *server in self.serverModelArr) {
        if ([self.serverTF.text isEqualToString:server.fn]) {
            isContain = YES;
        }
    }
    if (self.isFrom != YES) { // 说明是从战斗力界面进入的
        if (([self.nameTF.text isEqualToString:@""] || isContain == NO)) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请检查服务器和召唤师名称是否正确" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:nil];
            [alert addAction:sure];
            [self presentViewController:alert animated:YES completion:nil];
        } else  {
            FightViewController *fightVC = [[FightViewController alloc] init];
            fightVC.name = self.nameTF.text;
            fightVC.serverName = self.str;
            fightVC.binding = @"binding";
            [self.navigationController pushViewController:fightVC animated:YES];
        }
    } else {
        self.myBlock(self.nameTF.text, self.str);
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)cancelButton:(UIButton *)button {
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

//  网络请求获取数据
- (void)requireServerDataWithURL {
    
    [NetHandler getDataWithUrl:@"http://lolbox.duowan.com/phone/apiServers.php?v=70&OSType=iOS8.1.2&versionName=2.1.4" completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        self.serverModelArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in arr) {
            ServerModel *server = [[ServerModel alloc] init];
            [server setValuesForKeysWithDictionary:dic];
            [self.serverModelArr addObject:server];
        }
        [self.pickerView reloadAllComponents];
    }];
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
