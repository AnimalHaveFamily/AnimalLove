//
//  NameController.m
//  宠爱有家
//
//  Created by XXXX on 16/5/18.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "NameController.h"
#import "UIViewController+addLeftOrRightBarButton.h"

@interface NameController ()

@end

@implementation NameController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addRightBtnTitle:@"保存" action:@selector(saveAction)];
}
- (void)saveAction{
    NSLog(@"点击了保存按钮");
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
