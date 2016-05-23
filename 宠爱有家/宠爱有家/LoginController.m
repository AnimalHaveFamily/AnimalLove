//
//  LoginController.m
//  宠爱有家
//
//  Created by XXXX on 16/5/16.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "LoginController.h"
#import "UIViewController+addLeftOrRightBarButton.h"
#import "UIViewController+AlertAction.h"
#import "AnimalSigle.h"

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

- (IBAction)LoginBtnAction:(id)sender {
    
    AnimalSigle *single = [AnimalSigle SelfMessage];

    
    if ([self.phoneTextFiled.text isEqualToString:@"123456"] && [self.PassWorldTextFiled.text isEqualToString:@"123456"]) {
        single.username = self.phoneTextFiled.text;
        single.password = self.PassWorldTextFiled.text;
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    else
        if ([self.phoneTextFiled.text isEqualToString:@""] || [self.PassWorldTextFiled.text isEqualToString:@""]) {
            [self AlertMeaage:@"用户名或密码不能为空"];
        }
        else
            if (self.PassWorldTextFiled.text.length <= 3){
            [self AlertMeaage:@"密码不得小于3位"];
        }
    else
    [self AlertMeaage:@"用户名或密码错误"];
 
}


- (IBAction)eyeAction:(id)sender {

    
    self.eyeBtn.selected = !self.eyeBtn.selected;
    self.PassWorldTextFiled.secureTextEntry = passwoeld;
    passwoeld = !passwoeld;
   
}

- (void)registAction{
    NSLog(@"点击了注册按钮");
    
}
- (void)AlertMeaage:(NSString *)message{
    [self AddAlertMessage:message Style:UIAlertControllerStyleAlert rightActionMessage:@"确定"rightActionEnd:nil leftActionMessage:nil leftActionEnd:nil];
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
