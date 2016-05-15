//
//  YCTableView.h
//  宠爱有家
//
//  Created by ymcgz on 16/5/13.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum :  NSUInteger{
    YCTableViewPanDirectionLeft,
    YCTableViewPanDirectionRight,
}YCMainTableViewPanDirection;
@protocol YCTableViewDelegate <NSObject>

- (void)withdicection:(YCMainTableViewPanDirection)dicection;

@end

@interface YCTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , assign) CGPoint startPoint;

@property (nonatomic ,weak)id<YCTableViewDelegate>YCDelegate;
@end
