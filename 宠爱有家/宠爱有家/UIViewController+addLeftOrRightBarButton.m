//
//  UIViewController+addLeftOrRightBarButton.m
//  宠爱有家
//
//  Created by XXXX on 16/5/6.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "UIViewController+addLeftOrRightBarButton.h"

@implementation UIViewController (addLeftOrRightBarButton)

//重置导航条左边的按钮（Title）
- (void)addLeftBtnTitle:(NSString *)title action:(SEL)action{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleDone target:self action:action];
}


//重置导航条右边的按钮（Title）
- (void)addRightBtnTitle:(NSString *)title action:(SEL)action{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleDone target:self action:action];
}



//重置导航条左边的按钮（Image）
- (void)addLeftBtnImageName:(NSString *)imagename action:(SEL)action{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imagename] style:UIBarButtonItemStyleDone target:self action:action];
}


//重置导航条右边的按钮（Image）
- (void)addRightBtnImageName:(NSString *)imagename action:(SEL)action{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imagename] style:UIBarButtonItemStyleDone target:self action:action];
}


@end
