//
//  UIViewController+addLeftOrRightBarButton.h
//  宠爱有家
//
//  Created by XXXX on 16/5/6.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (addLeftOrRightBarButton)
- (void)addLeftBtnTitle:(NSString *)title action:(SEL)action;

- (void)addRightBtnTitle:(NSString *)title action:(SEL)action;


- (void)addLeftBtnImageName:(NSString *)imagename action:(SEL)action;


- (void)addRightBtnImageName:(NSString *)imagename action:(SEL)action;
@end
