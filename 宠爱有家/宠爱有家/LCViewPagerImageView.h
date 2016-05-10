//
//  LCViewPagerImageView.h
//  LCViewPager
//
//  Created by Awro on 16/3/12.
//  Copyright © 2016年 licong. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LCViewPagerImgViewDelegate <NSObject>
/**
 *  监听图片点击响应方法
 */
- (void)didImageViewClick;

@end

@interface LCViewPagerImageView : UIImageView

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, assign) id <LCViewPagerImgViewDelegate> delegate;

@end
