//
//  LCViewPager.h
//  LCViewPager
//
//  Created by Awro on 16/3/12.
//  Copyright © 2016年 licong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LCViewPagerDelegate <NSObject>

/**
 *  点击ViewPagerView触发的方法
 *
 *  @param tag 点击的第几张图片
 */
- (void)didViewPagerViewClick:(NSInteger)tag;

@end


@interface LCViewPagerView : UIView

@property (nonatomic, strong) NSArray *imageAry;
@property (nonatomic, assign) id <LCViewPagerDelegate> delegate;


@end
