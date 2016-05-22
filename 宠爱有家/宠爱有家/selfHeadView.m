//
//  selfHeadView.m
//  宠爱有家
//
//  Created by XXXX on 16/5/17.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "selfHeadView.h"
#import "LoginController.h"
#import "AnimalSigle.h"

@implementation selfHeadView

- (void)awakeFromNib{

    _window = [UIApplication sharedApplication].keyWindow;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat headbtnW = W/4.5;
    
    self.loginBtnWidth.constant = headbtnW;

    self.headbtnHeight.constant = headbtnW;
    self.headbtnWidth.constant = headbtnW;
    self.headButton.layer.cornerRadius = headbtnW / 2;
    self.headButton.layer.masksToBounds = YES;
    
    self.headButton.backgroundColor = [UIColor redColor];
}
- (IBAction)photoBtnAction:(id)sender {
//    AnimalSigle *sigle = [AnimalSigle SelfMessage];
//    if ([sigle.username isEqualToString:@""]) {
//        [self LoginBtnAction:sender];
//    }
    
    [self choosePhotoBtnImage];
    
 
   
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (image) {
        [_headButton setBackgroundImage:image forState:UIControlStateNormal];
        
        
    }
    [_window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}


- (void)choosePhotoBtnImage{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    imagePicker.allowsEditing = YES;
    //点击之后是否确认选择
    [_window.rootViewController presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)LoginBtnAction:(id)sender {

    LoginController *loginvc = [[LoginController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginvc];
    [_window.rootViewController presentViewController:nav animated:YES completion:nil];
    
    
}






@end
