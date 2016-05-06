//
//  UIViewController+PushViewControllerWithBarHidden.m
//  宠爱有家
//
//  Created by XXXX on 16/5/6.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "UIViewController+PushViewControllerWithBarHidden.h"

@implementation UIViewController (PushViewControllerWithBarHidden)

- (void)pushViewControllerWithTabBarHidden:(UIViewController *)vc{
    
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
    
}

@end
