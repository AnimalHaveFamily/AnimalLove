//
//  selfHeadView.h
//  宠爱有家
//
//  Created by XXXX on 16/5/17.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface selfHeadView : UIView<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *headButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headbtnHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headbtnWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginBtnWidth;
@property (nonatomic, strong)UIWindow *window;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UIImageView *text;




@end
