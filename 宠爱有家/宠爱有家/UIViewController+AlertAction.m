//
//  UIViewController+AlertAction.m
//  宠爱有家
//
//  Created by XXXX on 16/5/22.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "UIViewController+AlertAction.h"

@implementation UIViewController (AlertAction)

- (void)AddAlertTitle:(NSString *)title Message:(NSString *)string Style:(UIAlertControllerStyle)Style rightActionMessage:(NSString *)rightTitle rightActionEnd:(void (^ __nullable)(UIAlertAction *action))handler leftActionMessage:(NSString *)leftTitle leftActionEnd:(void (^ __nullable)(UIAlertAction *action))leftHandler CancelActionMessage:(NSString *)cancletitle cancelActionEnd:(void (^ __nullable)(UIAlertAction *action))cancle{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:string preferredStyle:Style];
    
    if (leftTitle) {
        UIAlertAction *leftAction = [UIAlertAction actionWithTitle:leftTitle style:UIAlertActionStyleDefault handler:leftHandler];
        [alertController addAction:leftAction];
        
    }
    
    if (rightTitle) {
        UIAlertAction *rightAction = [UIAlertAction actionWithTitle:rightTitle style:UIAlertActionStyleDefault handler:handler];
        
        [alertController addAction:rightAction];
    }
    
    if (cancletitle) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancletitle style:UIAlertActionStyleCancel handler:cancle];
        [alertController addAction:cancelAction];
    }
    
    

    [self presentViewController:alertController animated:YES completion:nil];
    
}





@end
