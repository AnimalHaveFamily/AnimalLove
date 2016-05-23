//
//  ShopCartCell.h
//  宠爱有家
//
//  Created by scjy on 16/5/16.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopCartCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *downBtn;
@property (weak, nonatomic) IBOutlet UITextField *numberTextFlied;
@property (weak, nonatomic) IBOutlet UILabel *costLabel;
@property (weak, nonatomic) IBOutlet UIButton *chooseBtn;

@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, copy) void( ^push)();
@property (nonatomic, copy) void(^backValue)(float);
@end
