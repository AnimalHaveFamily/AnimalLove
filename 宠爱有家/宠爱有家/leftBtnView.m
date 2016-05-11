//
//  leftBtnView.m
//  宠爱有家
//
//  Created by XXXX on 16/5/11.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "leftBtnView.h"

@implementation leftBtnView

- (void)awakeFromNib{
    [self.btn setImage:[UIImage imageNamed:@"nav_location_icon"] forState:UIControlStateNormal];
}
- (IBAction)LoacationAction:(id)sender {   
    self.LXPushMapBlock(1);
}
- (IBAction)OtherAction:(id)sender {
    self.LXPushMapBlock(1);
}



@end
