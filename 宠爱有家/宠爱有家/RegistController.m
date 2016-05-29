//
//  RegistController.m
//  宠爱有家
//
//  Created by XXXX on 16/5/23.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "RegistController.h"
#import "UIViewController+AlertAction.h"
#import "MBProgressHUD.h"
#import "AnimalSigle.h"
#import <SMS_SDK/SMSSDK.h>


@interface RegistController ()
{
    BOOL seePassWord;
}
@end

@implementation RegistController
- (void)viewDidLayoutSubviews{
    
    self.headView.layer.cornerRadius = 8;
    self.numberTextView.layer.cornerRadius = 8;
    self.messageNumberWidth.constant = W / 2;
    self.RegisterButton.layer.cornerRadius = 8;
    self.numberTextView.layer.masksToBounds = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册宠爱有家用户";
    self.view.backgroundColor = ViewBackColor;
}

//获取验证码方法
- (IBAction)getNumberAction:(id)sender {
    
    if ([self.RefistPasswordText.text isEqualToString:@""] || [self.RegistNumeberText.text isEqualToString:@""]) {
        
        [self AddAlertTitle:@"警告" Message:@"账户名或密码不能为空" Style:UIAlertControllerStyleAlert rightActionMessage:@"确定" rightActionEnd:nil leftActionMessage:nil leftActionEnd:nil CancelActionMessage:nil cancelActionEnd:nil];

        return;
    }
  
    
    
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.RegistNumeberText.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (!error) {
            NSLog(@"获取验证码成功");
            MBProgressHUD *proHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            proHUD.labelText = @"验证码已发送";
            proHUD.color = [UIColor grayColor];
            proHUD.mode = MBProgressHUDModeCustomView;
            [proHUD hide:YES afterDelay:1.5];
            
            
            [self.getCheckButton setTitle:@"验证码已发送" forState:UIControlStateNormal];
            [self.getCheckButton setBackgroundColor:[UIColor darkGrayColor]];
        }else{
            NSLog(@"获取验证码失败");
        }
    }];
}

//注册按钮的点击方法
- (IBAction)RegistBtnAction:(id)sender {
    
    AnimalSigle *singel = [AnimalSigle SelfMessage];

    
    
    
    
    [SMSSDK commitVerificationCode:self.checkText.text phoneNumber:self.RegistNumeberText.text zone:@"86" result:^(NSError *error) {
        if (!error) {
            NSLog(@"验证成功");
            singel.username = self.RegistNumeberText.text;
            singel.password = self.RefistPasswordText.text;

        [self dismissViewControllerAnimated:YES completion:nil];
            
        }else{
            NSLog(@"验证失败");
            
        }
    }];
 
}
- (IBAction)CanSeePassWordAction:(id)sender {
    self.SeePasswoedBtn.selected = !self.SeePasswoedBtn.selected;
    self.RefistPasswordText.secureTextEntry = seePassWord;
    seePassWord = !seePassWord;
    
    
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
