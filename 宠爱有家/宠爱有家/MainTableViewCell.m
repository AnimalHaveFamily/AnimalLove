//
//  MainTableViewCell.m
//  宠爱有家
//
//  Created by XXXX on 16/5/20.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell



- (void)awakeFromNib {
    
//    self.contentView.backgroundColor = [UIColor clearColor];
    
    
    
}



- (IBAction)removeBtnAction:(id)sender {
}

- (IBAction)DefoutBtnAction:(id)sender {

    self.DetailButton.selected = !self.DetailButton.selected;   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
