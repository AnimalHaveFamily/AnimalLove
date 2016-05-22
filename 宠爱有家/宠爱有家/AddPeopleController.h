//
//  AddPeopleController.h
//  宠爱有家
//
//  Created by XXXX on 16/5/19.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KeepControlDelegate <NSObject>



- (void)AddMessage:(NSMutableDictionary *)dic;
@end

@interface AddPeopleController : UIViewController


@property (nonatomic,assign) id<KeepControlDelegate>delegate;

@property (nonatomic,strong)NSArray *messageArr;


@property (weak, nonatomic) IBOutlet UIView *footView;
@property (weak, nonatomic) IBOutlet UIButton *provinceButton;
@property (weak, nonatomic) IBOutlet UITextField *reciveNameText;

@property (weak, nonatomic) IBOutlet UITextField *DetailAdressText;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberText;
@property (weak, nonatomic) IBOutlet UITextField *telephoneText;
@property (weak, nonatomic) IBOutlet UITextField *postNumberText;



@property (weak, nonatomic) IBOutlet UIView *firstView;

@property (weak, nonatomic) IBOutlet UIView *twoView;

@property (weak, nonatomic) IBOutlet UIView *threeView;

@property (weak, nonatomic) IBOutlet UIView *fureView;
@property (weak, nonatomic) IBOutlet UIView *fiveView;
@property (weak, nonatomic) IBOutlet UIView *sixView;




@end
