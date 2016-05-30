//
//  leftBtnView.m
//  宠爱有家
//
//  Created by XXXX on 16/5/11.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "leftBtnView.h"
#import "LocationHeadView.h"
#import "LocationViewController.h"

@implementation leftBtnView

- (void)awakeFromNib{
    [self.btn setImage:[UIImage imageNamed:@"nav_location_icon"] forState:UIControlStateNormal];
  
}

- (IBAction)OtherAction:(id)sender {
    LocationViewController *locationVC = [[LocationViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:locationVC];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window.rootViewController presentViewController:nav animated:YES completion:nil];
    
    locationVC.MyBlock = ^(NSString *st){
        
        [self.CityButton setTitle:st forState:UIControlStateNormal];
    };
}



@end
