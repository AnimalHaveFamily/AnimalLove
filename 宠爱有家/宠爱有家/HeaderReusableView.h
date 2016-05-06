//
//  HeaderReusableView.h
//  宠爱有家
//
//  Created by XXXX on 16/5/6.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderReusableView : UICollectionReusableView<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *bannerScrollView;

@property (weak, nonatomic) IBOutlet UICollectionView *introduceCollectionview;
@property (weak, nonatomic) IBOutlet UIButton *xihuBtn;
@property (weak, nonatomic) IBOutlet UIButton *jiyangBtn;
@property (weak, nonatomic) IBOutlet UIButton *MoreBtn;
@property (weak, nonatomic) IBOutlet UIButton *HealthBtn;

@property (nonatomic,strong)UIButton *btn;
@property (nonatomic,strong)NSArray *photoArr;

@property (nonatomic,strong)NSTimer *timer;

@end
