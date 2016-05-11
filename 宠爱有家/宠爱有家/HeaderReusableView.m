//
//  HeaderReusableView.m
//  宠爱有家
//
//  Created by XXXX on 16/5/6.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "HeaderReusableView.h"
#import "introduceCollectionViewCell.h"
//#import "BannerViewController.h"


@implementation HeaderReusableView



- (void)awakeFromNib {
    
    
    
    self.xihuBtn.layer.borderWidth = 1.0;
    self.xihuBtn.layer.borderColor = [UIColor blackColor].CGColor;
    
    self.jiyangBtn.layer.borderWidth = 1.0;
    self.jiyangBtn.layer.borderColor = [UIColor blackColor].CGColor;
    self.HealthBtn.layer.borderWidth = 1.0;
    self.HealthBtn.layer.borderColor = [UIColor blackColor].CGColor;
    
    self.MoreBtn.layer.borderWidth = 1.0;
    self.MoreBtn.layer.borderColor = [UIColor blackColor].CGColor;
    
    
    [self.introduceCollectionview registerNib:[UINib nibWithNibName:@"introduceCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellId"];
    

    

    LCViewPagerView *viewPager = [[LCViewPagerView alloc] initWithFrame:CGRectMake(0, 0, self.bannerScrollView.frame.size.width, self.bannerScrollView.frame.size.height)];
    viewPager.delegate = self;
    viewPager.imageAry = @[@"con_banner1",@"con_banner2",@"con_banner3"];
    [self addSubview:viewPager];
    


}


- (void)touchAction:(SEL)action{
    
    [_btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
}



- (void)didViewPagerViewClick:(NSInteger)tag
{
    
    self.LXPushBlock(tag);

    NSLog(@"点击了第%ld张图片(long)",tag);
    

}




//定义显示collectionview的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return 6;
}





//定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return CGSizeMake(150,130);
}



- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}





- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    introduceCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    return cell;
}


@end
