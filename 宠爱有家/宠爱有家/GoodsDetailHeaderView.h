//
//  GoodsDetailHeaderView.h
//  宠爱有家
//
//  Created by scjy on 16/5/13.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCViewPagerView.h"
@interface GoodsDetailHeaderView : UIView<LCViewPagerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *bannerView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewH;

@end
