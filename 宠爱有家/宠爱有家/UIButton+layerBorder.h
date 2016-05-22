//
//  UIButton+layerBorder.h
//  宠爱有家
//
//  Created by scjy on 16/5/11.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (layerBorder)

//添加Button的边框
- (void)addBorderWidth:(float)width borderColor:(UIColor *)color;

//商城中给大Button添加内容
- (void)addLabelName:(NSString *)labelName1 LabelName:(NSString *)labelName2 ImageName:(NSString *)imageName;

//商城中给小Button添加内容
- (void)addLabelName:(NSString *)labelName1 LabelName:(NSString *)labelName2 LabelName:(NSString *)labelName3 ImageName:(NSString *)imageName;
@end
