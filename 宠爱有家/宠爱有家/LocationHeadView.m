//
//  LocationHeadView.m
//  宠爱有家
//
//  Created by XXXX on 16/5/13.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "LocationHeadView.h"

@implementation LocationHeadView
- (void)awakeFromNib{

    [self CreatSearchBar];

    self.lightView.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
//    NSLog(@"%f",self.frame.size.height);
    self.frame = CGRectMake(0, 0, W, 530);

}

- (void)CreatSearchBar{
    self.SearchBar.layer.cornerRadius = 17;
    [self.SearchBar.layer setBorderWidth:8];
    [self.SearchBar.layer setBorderColor:[UIColor colorWithWhite:0.93 alpha:1].CGColor];
    self.SearchBar.layer.masksToBounds = YES;
    
}


- (IBAction)BeiJingBtnAction:(UIButton *)btn{
    self.LocationBlock(btn.titleLabel.text);
}


@end
