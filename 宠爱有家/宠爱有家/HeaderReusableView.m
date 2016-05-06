//
//  HeaderReusableView.m
//  宠爱有家
//
//  Created by XXXX on 16/5/6.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "HeaderReusableView.h"
#import "introduceCollectionViewCell.h"

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
    
    self.photoArr = @[@"eat_00",@"pie_14",@"eat_02"];
    self.bannerScrollView.contentSize = CGSizeMake(3 * W, 0);
    self.bannerScrollView.delegate = self;
    for (int i = 0; i < 3; i ++) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(W * i, 0, W, self.bannerScrollView.frame.size.height)];
        [_btn setImage:[UIImage imageNamed:self.photoArr[i]] forState:UIControlStateNormal];
        [self.bannerScrollView addSubview:_btn];

        _btn.tag = i;
        
        if (_btn.tag == 0) {
          [self touchAction:@selector(action0)];
        }
        
        if (_btn.tag == 1) {
         [self touchAction:@selector(action1)];
        }
        
        if (_btn.tag == 2) {
            
            [self touchAction:@selector(action2)];
            
        }
    }
    
    timezone = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];

}

- (void)scrollTimer{
    

//    NSLog(@"_timer == %ld",timezone);
    timezone ++;
    
    if (timezone == 3) {
        timezone = 0;
    }

   [_bannerScrollView setContentOffset:CGPointMake(timezone * W, 0) animated:YES];
    
    
}

- (void)touchAction:(SEL)action{
    
    [_btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)action0{
    NSLog(@"0");
}
- (void)action1{
    NSLog(@"1");
}
- (void)action2{
        NSLog(@"2");
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
