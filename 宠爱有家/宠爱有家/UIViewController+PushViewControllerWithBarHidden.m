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
    
    if (self.navigationController.viewControllers.count > 0) {
        vc.hidesBottomBarWhenPushed = YES;
    }
    [self.navigationController pushViewController:vc animated:YES];
    

    
}

@end
