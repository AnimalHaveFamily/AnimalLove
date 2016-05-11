//
//  leftBtnView.h
//  宠爱有家
//
//  Created by XXXX on 16/5/11.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PushMapBlock)(NSInteger tab);

@interface leftBtnView : UIView
@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (nonatomic,copy)PushMapBlock LXPushMapBlock;

@end
