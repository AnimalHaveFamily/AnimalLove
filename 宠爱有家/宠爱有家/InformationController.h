//
//  InformationController.h
//  宠爱有家
//
//  Created by XXXX on 16/5/18.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationController : UITableViewController
@property (weak, nonatomic) IBOutlet UITableViewCell *headPhotoCell;
@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@property (strong, nonatomic) IBOutlet UITableView *informationTableView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *numberLab;

@property (nonatomic,strong)UIImagePickerController *ImagePicker;
@end
