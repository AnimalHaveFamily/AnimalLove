//
//  HeaderReusableView.h
//  宠爱有家
//
//  Created by XXXX on 16/5/6.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCViewPagerView.h"

typedef void(^PushBlock)(NSInteger tab);

//@protocol LXPushDelegate <NSObject>
//
//- (void)pushAction:(NSInteger)tab;
//@end

@interface HeaderReusableView : UICollectionReusableView <LCViewPagerDelegate>

@property (nonatomic,copy)PushBlock LXPushBlock;


@property (weak, nonatomic) IBOutlet UIScrollView *bannerScrollView;

@property (weak, nonatomic) IBOutlet UICollectionView *introduceCollectionview;


@property (nonatomic,strong)UIButton *btn;

//@property (nonatomic, assign) id <LXPushDelegate> delegate;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *BnanerViewHeight;

@end
