//
//  LocationHeadView.h
//  宠爱有家
//
//  Created by XXXX on 16/5/13.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LocationBtnBlock)(NSString *str);

@interface LocationHeadView : UIView
@property (nonatomic ,copy)LocationBtnBlock LocationBlock;


@property (weak, nonatomic) IBOutlet UIView *SearchBarView;
@property (weak, nonatomic) IBOutlet UISearchBar *SearchBar;
@property (weak, nonatomic) IBOutlet UIView *lightView;
@property (weak, nonatomic) IBOutlet UILabel *nowLocation;
@property (weak, nonatomic) IBOutlet UIButton *nowButton;



@end
