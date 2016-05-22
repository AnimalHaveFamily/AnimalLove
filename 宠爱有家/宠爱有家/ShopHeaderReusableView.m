//
//  ShopHeaderReusableView.m
//  宠爱有家
//
//  Created by scjy on 16/5/10.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "ShopHeaderReusableView.h"
#import "UIButton+layerBorder.h"
@implementation ShopHeaderReusableView

- (void)awakeFromNib {
    
    [self.firstBtn addBorderWidth:1 borderColor:[UIColor blackColor]];
    [self.secondBtn addBorderWidth:1 borderColor:[UIColor blackColor]];
    [self.thirdBtn addBorderWidth:1 borderColor:[UIColor blackColor]];
    [self.fourthBtn addBorderWidth:1 borderColor:[UIColor blackColor]];
    [self.fifthBtn addBorderWidth:1 borderColor:[UIColor blackColor]];
    [self.sixthBtn addBorderWidth:1 borderColor:[UIColor blackColor]];
    
    

    //添加轮播图
    LCViewPagerView *viewPager = [[LCViewPagerView alloc] initWithFrame:CGRectMake(0, 0, W, self.bannerViewH.constant)];
    viewPager.delegate = self;
    viewPager.imageAry = @[@"eat_00",@"pie_14",@"eat_02"];
    [self addSubview:viewPager];
    
    [self.thirdBtn addLabelName:@"全球购GO波奇" LabelName:@"内测开启  提前尝鲜" ImageName:@"con-shoppic1"];
    
    [self.fourthBtn addLabelName:@"宠物常备药箱" LabelName:@"口腔、肠胃、皮肤" ImageName:@"con-shoppic4"];

}
//点击轮播图的方法
- (void)didViewPagerViewClick:(NSInteger)tag
{

}
@end
