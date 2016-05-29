//
//  InformationController.m
//  宠爱有家
//
//  Created by XXXX on 16/5/18.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "InformationController.h"
#import "AdressController.h"
#import "UIViewController+PushViewControllerWithBarHidden.h"
#import "UIViewController+AlertAction.h"
#import "UIImageView+WebCache.h"


@interface InformationController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic ,strong)AnimalSigle *mySingle;

@end

@implementation InformationController

- (void)viewWillAppear:(BOOL)animated{
   
}


- (void)viewDidLayoutSubviews{
    self.view.backgroundColor = ViewBackColor;
    self.headImgView.layer.cornerRadius = 51 / 2;
    self.headImgView.layer.masksToBounds = YES;
    self.footView.backgroundColor = ViewBackColor;
    self.logoutButton.layer.cornerRadius = 8;
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _mySingle = [AnimalSigle SelfMessage];
 
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:_mySingle.headPhoto] placeholderImage:[UIImage imageNamed:@"QQ-1"]];
    self.nameLable.text = _mySingle.username;
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (image) {
        _headImgView.image = image;
    }
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)logoutBtnAction:(id)sender {
    
    [self AddAlertTitle:@"温馨提示" Message:@"确定要注销当前账号吗?" Style:UIAlertControllerStyleAlert rightActionMessage:@"确定"rightActionEnd:^(UIAlertAction *action) {
        
        _mySingle.username = nil;
        _mySingle.headPhoto = nil;
        _mySingle.password = nil;
        
        [self.navigationController popViewControllerAnimated:YES];
        
    } leftActionMessage:@"取消" leftActionEnd:nil CancelActionMessage:nil cancelActionEnd:nil];
    
   
}




#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        
        [self AddAlertTitle:nil Message:nil Style:UIAlertControllerStyleActionSheet rightActionMessage:@"从手机相册选取" rightActionEnd:^(UIAlertAction *action) {
            [self ChosePhotoWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            
        } leftActionMessage:@"拍照" leftActionEnd:^(UIAlertAction *action) {
            [self ChosePhotoWithSourceType:UIImagePickerControllerSourceTypeCamera];
            
        } CancelActionMessage:@"取消" cancelActionEnd:nil];
    }

    
    if (indexPath.section == 1 && indexPath.row == 2) {
        AdressController *adressVC = [[AdressController alloc] init];
        [self pushViewControllerWithTabBarHidden:adressVC];
        self.hidesBottomBarWhenPushed = YES;
        
    }
    
}

- (void)ChosePhotoWithSourceType:(UIImagePickerControllerSourceType)type{
    _ImagePicker = [[UIImagePickerController alloc] init];
    _ImagePicker.delegate = self;
    _ImagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    _ImagePicker.allowsEditing = YES;
    //点击之后是否确认选择
    _ImagePicker.sourceType = type;
    
    [self presentViewController:_ImagePicker animated:YES completion:nil];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
