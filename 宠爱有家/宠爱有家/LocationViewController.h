//
//  LocationViewController.h
//  宠爱有家
//
//  Created by XXXX on 16/5/11.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^Block)(NSString *string);

@interface LocationViewController : UIViewController

@property (nonatomic ,copy)Block MyBlock;

@end
