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
#import "RegistController.h"
#import "UIViewController+PushViewControllerWithBarHidden.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
#import <ShareSDKExtension/SSEThirdPartyLoginHelper.h>
#import "MBProgressHUD.h"

@interface LoginController ()
{
    BOOL passwoeld;
}
@property (nonatomic ,strong)AnimalSigle *singlee;
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
    
    _singlee = [AnimalSigle SelfMessage];
   
}

- (void)backAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)LoginBtnAction:(id)sender {
    
    AnimalSigle *single = [AnimalSigle SelfMessage];

        if ([self.phoneTextFiled.text isEqualToString:@""] || [self.PassWorldTextFiled.text isEqualToString:@""]) {
            [self AlertMeaage:@"用户名或密码不能为空"];
        }
        else
            if (self.PassWorldTextFiled.text.length <= 3){
            [self AlertMeaage:@"密码不得小于3位"];
        }
    else
        if ([self.phoneTextFiled.text isEqualToString:single.username] && [self.PassWorldTextFiled.text isEqualToString:single.password]) {
            [self dismissViewControllerAnimated:YES completion:nil];
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
    RegistController *registVc = [[RegistController alloc] init];
    [self pushViewControllerWithTabBarHidden:registVc];
    
}
- (void)AlertMeaage:(NSString *)message{

    [self AddAlertTitle:@"警告" Message:message Style:UIAlertControllerStyleAlert rightActionMessage:@"确定" rightActionEnd:nil leftActionMessage:nil leftActionEnd:nil CancelActionMessage:nil cancelActionEnd:nil];
}

- (IBAction)sinaAction:(id)sender {
    
    [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        if (state == SSDKResponseStateSuccess) {

            _singlee.username = user.nickname;
            _singlee.headPhoto = [user.rawData objectForKey:@"avatar_hd"];
            [self addLoginView];
  
            [self dismissViewControllerAnimated:YES completion:nil];
            
//            NSLog(@"uid == %@",user.uid);
//            
//            NSLog(@"授权凭证%@",user.credential);
//            //为nil代表未授权
//            
//            NSLog(@"token == %@",user.credential.token);
//            //用户令牌
//            
//            NSLog(@"昵称 = %@",user.nickname);
//            //昵称
//            
//            NSLog(@"头像= %@",user.rawData);
        }
        else{
            NSLog(@"错误信息:%@",error);
        }
    }];
}


- (IBAction)QQAction:(id)sender {
    [ShareSDK getUserInfo:SSDKPlatformTypeQQ onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        if (state == SSDKResponseStateSuccess) {
                       _singlee.username = user.nickname;
            _singlee.headPhoto = [user.rawData objectForKey:@"figureurl_qq_2"];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else{
            NSLog(@"错误信息:%@",error);
        }
    }];
}

- (IBAction)wechatAction:(id)sender {
    
    [ShareSDK getUserInfo:SSDKPlatformTypeWechat onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        if (state == SSDKResponseStateSuccess) {
                   }else{
            NSLog(@"错误:%@",error);
        }
    }];
   
}

-(void)addLoginView{
    MBProgressHUD *proHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    proHUD.labelText = @"正在登录中...";
    proHUD.color = [UIColor grayColor];
    proHUD.mode = MBProgressHUDModeCustomView;
    [proHUD hide:YES afterDelay:1.5];
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
