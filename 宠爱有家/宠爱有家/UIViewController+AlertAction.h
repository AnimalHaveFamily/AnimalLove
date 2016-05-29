//
//  UIViewController+AlertAction.h
//  宠爱有家
//
//  Created by XXXX on 16/5/22.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AlertAction)

- (void)AddAlertTitle:(NSString *)title Message:(NSString *)string Style:(UIAlertControllerStyle)Style rightActionMessage:(NSString *)rightTitle rightActionEnd:(void (^ __nullable)(UIAlertAction *action))handler leftActionMessage:(NSString *)leftTitle leftActionEnd:(void (^ __nullable)(UIAlertAction *action))leftHandler CancelActionMessage:(NSString *)cancletitle cancelActionEnd:(void (^ __nullable)(UIAlertAction *action))cancle;


@end
