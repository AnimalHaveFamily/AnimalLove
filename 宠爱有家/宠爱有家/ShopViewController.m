//
//  ShopViewController.m
//  宠爱有家
//
//  Created by XXXX on 16/5/5.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "ShopViewController.h"
#import "UIViewController+addLeftOrRightBarButton.h"
#import "UIViewController+PushViewControllerWithBarHidden.h"
#import "ShopCollectionViewCell.h"
#import "ShopHeaderReusableView.h"
#import "GoodsDetailViewController.h"
//#import "RequestManager.h"
#import <AFNetworking.h>


@interface ShopViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate>

@property (nonatomic, strong) UICollectionView *shopCollectionView;
//@property (nonatomic, strong) GLSegment *segment;

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"商城";
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    self.shopCollectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    
    self.shopCollectionView.delegate = self;
    self.shopCollectionView.dataSource = self;
    
    [self.view addSubview:self.shopCollectionView];
    
    [self.shopCollectionView registerNib:[UINib nibWithNibName:@"ShopCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    [self.shopCollectionView registerNib:[UINib nibWithNibName:@"ShopHeaderReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",@"text/html",nil];
    [manager GET:@"http://shopapi.boqii.com/mobile.getprolist-13597,15618,14908,17122,17123,16438,16439,13599,17004,15619,15578,15622.html?AppVersion=2.5.1&UDID=4ee195d5752aa01d0c86b2f90662203c9dc59163&UDID=dbc44f0779d35ace823a3bd9ef8d9ad9ec368096" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}
#pragma mark -- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 3;
            break;
        default:
            return 4;
            break;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

#pragma mark -- UICollectionViewDelegateFlowLayout

//每个item的宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return (CGSize){W, 170};
    }else{
        return (CGSize){162, 177};
    }
}

//header的size（每一组头部的宽高）
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(W, 499);
    }else{
        return CGSizeZero;
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section

{
    
    return UIEdgeInsetsMake(10, 15, 0, 15);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    ShopHeaderReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
    
    headerView.backgroundColor = [UIColor orangeColor];
    
    
    return headerView;
}
//点击collectionView的item触发的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor redColor];
        [self pushViewControllerWithTabBarHidden:vc];
        
    }else{
        GoodsDetailViewController *vc2 = [[GoodsDetailViewController alloc] init];
        vc2.view.backgroundColor = [UIColor cyanColor];
        [self pushViewControllerWithTabBarHidden:vc2];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
