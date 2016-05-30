//
//  MainViewController.m
//  宠爱有家
//
//  Created by XXXX on 16/5/5.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "MainViewController.h"
#import "UIViewController+addLeftOrRightBarButton.h"
#import "UIViewController+PushViewControllerWithBarHidden.h"
#import "MessageViewController.h"
#import "HeaderReusableView.h"
#import "MainCollectionViewCell.h"
#import "BannerViewController.h"
#import "UIViewController+PushViewControllerWithBarHidden.h"
#import "leftBtnView.h"
#import "LocationViewController.h"

@interface MainViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UISearchBarDelegate>
{
    UICollectionView *maincollView;
    UICollectionViewFlowLayout *layout;
    
}

@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
  


    [self addRightBtnImageName:@"nav_news_icon" action:@selector(rightmessageAction)];

    [self creatSearchBtn];
    [self createLocationBtn];


    layout = [[UICollectionViewFlowLayout alloc] init];
    
    maincollView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, W, H) collectionViewLayout:layout];
    maincollView.backgroundColor = [UIColor cyanColor];
    maincollView.delegate = self;
    maincollView.dataSource = self;
    [self.view addSubview:maincollView];
    
    [maincollView registerNib:[UINib nibWithNibName:@"MainCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellId"];
    

    
    [maincollView registerNib:[UINib nibWithNibName:@"HeaderReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    


}

- (void)creatSearchBtn{
    

    
    UIView *titleview = [[[NSBundle mainBundle] loadNibNamed:@"SearchBackView" owner:nil options:nil] lastObject];
    titleview.backgroundColor = [UIColor colorWithRed:1.0 green:0 blue:0 alpha:0];
    [self.navigationItem.titleView sizeToFit];
    self.navigationItem.titleView = titleview;
    
}
- (void)createLocationBtn{
    
    leftBtnView *view = [[[NSBundle mainBundle] loadNibNamed:@"leftBtnView" owner:nil options:nil] lastObject];
    view.frame = CGRectMake(0, 0, 50, 30);
    view.backgroundColor = [UIColor colorWithRed:1.0 green:0 blue:0 alpha:0];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
}





//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 1;
//}


//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainCollectionViewCell *cell = (MainCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];

    
    cell.backgroundColor = [UIColor yellowColor];
    
    return cell;
}

//设置每个item的尺寸(代理方法实现的)
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(130, 160);
}



//header的size（每一组头部的宽高）
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, 400);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


//通过设置SupplementaryViewOfKind 来设置头部或者底部的view，其中 ReuseIdentifier 的值必须和 注册是填写的一致，本例都为 “reusableView”
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeaderReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
    
    headerView.backgroundColor = [UIColor orangeColor];
    
        typeof(self) myself = self;
    headerView.LXPushBlock = ^(NSInteger a){
        BannerViewController *banvc = [[BannerViewController alloc] init];
        [myself pushViewControllerWithTabBarHidden:banvc];
    };

    return headerView;
}




- (void)rightmessageAction{

    
    [self pushViewControllerWithTabBarHidden:[[MessageViewController alloc] init]];
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
