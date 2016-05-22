//
//  LoginController.m
//  宠爱有家
//
//  Created by XXXX on 16/5/16.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "LoginController.h"
#import "UIViewController+addLeftOrRightBarButton.h"

@interface LoginController ()
{
    BOOL passwoeld;
}

@end

@implementation LoginController

- (void)viewDidLayoutSubviews{
    self.LoginButton.backgroundColor = Animalcolor;

    self.LoginButton.layer.cornerRadius = 8;
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"波奇用户登录";
    [self addRightBtnTitle:@"注册" action:@selector(registAction)];
    [self addLeftBtnImageName:@"nav_location_icon" action:@selector(backAction)];
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    self.loginview.layer.cornerRadius = 8;
}

- (void)backAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)eyeAction:(id)sender {

    
    self.eyeBtn.selected = !self.eyeBtn.selected;
    self.PassWorldTextFiled.secureTextEntry = passwoeld;
    passwoeld = !passwoeld;
    
    
}

- (void)registAction{
    NSLog(@"点击了注册按钮");
    
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
