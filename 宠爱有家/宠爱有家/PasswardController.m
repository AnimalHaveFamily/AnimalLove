//
//  PasswardController.m
//  宠爱有家
//
//  Created by XXXX on 16/5/19.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "PasswardController.h"

@interface PasswardController ()
{
    BOOL passwoeld;
    BOOL two;
    BOOL three;
}

@end

@implementation PasswardController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.SureButton.layer.cornerRadius = 7;
}

- (IBAction)SeePasswardAction:(UIButton *)btn {
    btn.selected = !btn.selected;
    self.NowPasswordText.secureTextEntry = passwoeld;
    passwoeld = !passwoeld;
  

}

- (IBAction)secondSeeAction:(UIButton *)btn {
    
    btn.selected = !btn.selected;
    self.NewPasswordText.secureTextEntry = two;
    two = !two;

    
}
- (IBAction)thirdSeeAction:(UIButton *)btn {
    btn.selected = !btn.selected;
    self.SureNewPassText.secureTextEntry = three;
    three = !three;
    
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
