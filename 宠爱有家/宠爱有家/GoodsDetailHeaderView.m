//
//  GoodsDetailHeaderView.m
//  宠爱有家
//
//  Created by scjy on 16/5/13.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "GoodsDetailHeaderView.h"

@implementation GoodsDetailHeaderView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
}
- (void)layoutSubviews
{
    //加载轮播图
    LCViewPagerView *viewPager = [[LCViewPagerView alloc] initWithFrame:CGRectMake(0, 0, W, self.scrollViewH.constant)];
    viewPager.delegate = self;
    viewPager.imageAry = @[@"1",@"1",@"1"];
    [self addSubview:viewPager];
    self.frame = (CGRect){0, 0, W, self.scrollViewH.constant + 63 + 16};

}
- (void)didViewPagerViewClick:(NSInteger)tag
{

}

@end
