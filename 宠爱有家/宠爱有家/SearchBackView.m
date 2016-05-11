//
//  SearchBackView.m
//  宠爱有家
//
//  Created by XXXX on 16/5/11.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "SearchBackView.h"

@implementation SearchBackView

- (void)awakeFromNib{
        self.myscrollerview.layer.cornerRadius = 14;
        [self.myscrollerview.layer setBorderWidth:8];
        [self.myscrollerview.layer setBorderColor:[UIColor whiteColor].CGColor];
        self.myscrollerview.layer.masksToBounds = YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
