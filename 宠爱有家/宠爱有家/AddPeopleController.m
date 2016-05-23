//
//  AddPeopleController.m
//  宠爱有家
//
//  Created by XXXX on 16/5/19.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "AddPeopleController.h"
#import "UIViewController+addLeftOrRightBarButton.h"

@interface AddPeopleController ()
{
    UIColor *widthcolor;
    UIAlertAction *actionSure;
    
    
   
}

@end

@implementation AddPeopleController

- (void)viewDidLayoutSubviews{
    
    widthcolor = [UIColor colorWithWhite:0.9 alpha:1];
    self.footView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [self setWithView:self.firstView];
    [self setWithView:self.twoView];
    [self setWithView:self.threeView];
    [self setWithView:self.fureView];
    [self setWithView:self.fiveView];
    [self setWithView:self.sixView];
   
  

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addRightBtnTitle:@"保存" action:@selector(keepMessageAction)];
    
    actionSure = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
}

- (NSArray *)messageArr{
    if (!_messageArr) {
        _messageArr = [[NSArray alloc] init];
    }
    return _messageArr;
}

- (void)keepMessageAction{

    if ([self.reciveNameText.text isEqualToString:@""]) {
        [self Alert:@"请输入用户名"];
        return;
        
    }
    if ([self.DetailAdressText.text isEqualToString:@""]) {
        [self Alert:@"请输入详细地址"];
        return;
        
    }

    if ([self.phoneNumberText.text isEqualToString:@""]) {
        [self Alert:@"请输入手机号"];
                return;
    }


    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    [dic setObject:self.reciveNameText.text forKey:@"name"];
    [dic setObject:self.DetailAdressText.text forKey:@"place"];
    [dic setObject:self.phoneNumberText.text forKey:@"number"];
    [dic setObject:self.telephoneText.text forKey:@"call"];
    [dic setObject:self.postNumberText.text forKey:@"post"];
    
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(AddMessage:)] ){
        [self.delegate AddMessage:dic];
    }
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (void)Alert:(NSString *)string{
    UIAlertController *content = [UIAlertController alertControllerWithTitle:@"警告" message:string preferredStyle:UIAlertControllerStyleAlert];
    [content addAction:actionSure];
    [self presentViewController:content animated:YES completion:nil];
}


- (void)setWithView:(UIView *)myview{

    myview.layer.borderWidth = 0.55;
    myview.layer.borderColor = widthcolor.CGColor;
    
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
