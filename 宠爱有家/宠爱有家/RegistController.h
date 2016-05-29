//
//  RegistController.h
//  宠爱有家
//
//  Created by XXXX on 16/5/23.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *messageNumberWidth;
@property (weak, nonatomic) IBOutlet UIView *numberTextView;
@property (weak, nonatomic) IBOutlet UIButton *RegisterButton;
@property (weak, nonatomic) IBOutlet UIButton *SeePasswoedBtn;

@property (weak, nonatomic) IBOutlet UIButton *getCheckButton;





@property (weak, nonatomic) IBOutlet UITextField *RegistNumeberText;

@property (weak, nonatomic) IBOutlet UITextField *RefistPasswordText;
@property (weak, nonatomic) IBOutlet UITextField *checkText;


@end
