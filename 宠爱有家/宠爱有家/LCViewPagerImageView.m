//
//  LCViewPagerImageView.m
//  LCViewPager
//
//  Created by Awro on 16/3/12.
//  Copyright © 2016年 licong. All rights reserved.
//

#import "LCViewPagerImageView.h"

@interface LCViewPagerImageView ()<UIGestureRecognizerDelegate>

@end

@implementation LCViewPagerImageView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        //添加图片点击方法
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        //单击点击有效
        tap.numberOfTapsRequired = 1;
        //1个手指点击有效
        tap.numberOfTouchesRequired = 1;
        tap.delegate = self;
        [self addGestureRecognizer:tap];
    }
    return self;
}
/**
 *  通过在该方法内改变加载图片的方法
 *
 *  @param imageName 图片名,也是可以是网络图片地址，网络图片加载自行修改该方法
 */
- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    self.image = [UIImage imageNamed:imageName];
}

//点击手势
- (void)tap
{
    if ([self.delegate respondsToSelector:@selector(didImageViewClick)]) {
        [self.delegate didImageViewClick];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
