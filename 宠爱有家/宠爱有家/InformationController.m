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

@interface InformationController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation InformationController

//- (UIImagePickerController *)ImagePicker{
//    if (!_ImagePicker) {
//        _ImagePicker = [[UIImagePickerController alloc] init];
//            }
//    return _ImagePicker;
//}


- (void)viewDidLayoutSubviews{
    self.view.backgroundColor = ViewBackColor;
    self.headImgView.layer.cornerRadius = 51 / 2;
    self.headImgView.layer.masksToBounds = YES;
    self.footView.backgroundColor = ViewBackColor;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLable.text = @"哈哈";
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (image) {
        _headImgView.image = image;
    }
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0 && indexPath.row == 0) {

        UIAlertController *alertvc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        
        
        UIAlertAction *takePhotoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了拍照按钮");
        }];
        UIAlertAction *usePhotoAction = [UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            _ImagePicker = [[UIImagePickerController alloc] init];
            _ImagePicker.delegate = self;
            _ImagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            _ImagePicker.allowsEditing = YES;
            //点击之后是否确认选择
            _ImagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            [self presentViewController:_ImagePicker animated:YES completion:nil];
            
        }];

        
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertvc addAction:takePhotoAction];
        [alertvc addAction:usePhotoAction];
        [alertvc addAction:cancleAction];
        [self presentViewController:alertvc animated:YES completion:nil];
   
    }
    
    if (indexPath.section == 1 && indexPath.row == 2) {
        AdressController *adressVC = [[AdressController alloc] init];
        [self pushViewControllerWithTabBarHidden:adressVC];
        self.hidesBottomBarWhenPushed = YES;
        
    }
    
}


@end
