//
//  UIButton+layerBorder.m
//  宠爱有家
//
//  Created by scjy on 16/5/11.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "UIButton+layerBorder.h"

@implementation UIButton (layerBorder)
- (void)addBorderWidth:(float)width borderColor:(UIColor *)color
{
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}
- (void)addLabelName:(NSString *)labelName1 LabelName:(NSString *)labelName2 ImageName:(NSString *)imageName
{
    self.backgroundColor = [UIColor whiteColor];
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, self.frame.size.width, 20)];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.text = labelName1;
    label1.font = [UIFont systemFontOfSize:26];
    label1.textColor = [UIColor blackColor];
    [self addSubview:label1];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 33, self.frame.size.width, 20)];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.text = labelName2;
    label2.font = [UIFont systemFontOfSize:16];
    label2.textColor = [UIColor lightGrayColor];
    [self addSubview:label2];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 55, self.frame.size.width, self.frame.size.height - 55)];
//    imageView.image = [UIImage imageNamed:imageName];
//    [self addSubview:imageView];
    
}
- (void)addLabelName:(NSString *)labelName1 LabelName:(NSString *)labelName2 LabelName:(NSString *)labelName3 ImageName:(NSString *)imageName
{
    
}
@end
