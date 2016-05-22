//
//  JiBieView.h
//  宠爱有家
//
//  Created by ymcgz on 16/5/22.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WSNoFound (-1)

#define LeftButtonTitle @"分类"
#define RightButtonTitle @"离我最近"


/**
 *  目前是写死的 左边三级－ 修改的话 挺简单的  只要 修改didselect 点到第二级收回  还有修改tableview的宽度 既可以了  －
 */



@interface WSIndexPath : NSObject


@property (nonatomic,assign) NSInteger column; //区分  0 为左边的   1 是 右边的
@property (nonatomic,assign) NSInteger row; //左边第一级的行
@property (nonatomic,assign) NSInteger item; //左边第二级的行
@property (nonatomic,assign) NSInteger rank; //左边第三级的行

+ (instancetype)twIndexPathWithColumn:(NSInteger )column
                                  row:(NSInteger )row
                                 item:(NSInteger )item
                                 rank:(NSInteger )rank;

@end

@class WSDropMenuView;

@protocol WSDropMenuViewDataSource <NSObject>


- (NSInteger )dropMenuView:(WSDropMenuView *)dropMenuView numberWithIndexPath:(WSIndexPath *)indexPath;

- (NSString *)dropMenuView:(WSDropMenuView *)dropMenuView titleWithIndexPath:(WSIndexPath *)indexPath;

@end

@protocol WSDropMenuViewDelegate <NSObject>

- (void)dropMenuView:(WSDropMenuView *)dropMenuView didSelectWithIndexPath:(WSIndexPath *)indexPath;

@end

@interface WSDropMenuView : UIView

@property (nonatomic,weak) id<WSDropMenuViewDataSource> dataSource;
@property (nonatomic,weak) id<WSDropMenuViewDelegate> delegate;

- (void)reloadLeftTableView;

- (void)reloadRightTableView;

@end
