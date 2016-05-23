//
//  ShopHeaderReusableView.h
//  宠爱有家
//
//  Created by scjy on 16/5/10.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCViewPagerView.h"
@interface ShopHeaderReusableView : UICollectionReusableView<LCViewPagerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *bannerView;
@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (weak, nonatomic) IBOutlet UIButton *fourthBtn;
@property (weak, nonatomic) IBOutlet UIButton *fifthBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondBtn;
@property (weak, nonatomic) IBOutlet UIButton *thirdBtn;
@property (weak, nonatomic) IBOutlet UIButton *sixthBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bannerViewH;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *smallBtnH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bigBtnH;

@end
