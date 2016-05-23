//
//  GoodsDetailViewController.m
//  宠爱有家
//
//  Created by scjy on 16/5/13.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "GoodsDetailViewController.h"
#import "GoodsDetailCell.h"
#import "CommentCell.h"
#import "GoodsDetailHeaderView.h"
#import "GLSegment.h"
#import "UIViewController+addLeftOrRightBarButton.h"
#import "Masonry.h"
#import "ShopCartViewController.h"
#import "UIViewController+PushViewControllerWithBarHidden.h"
#import "MBProgressHUD.h"
@interface GoodsDetailViewController ()<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>

@property (nonatomic, strong) UITableView *goodsDetailTableView;
@property (nonatomic, strong) GoodsDetailHeaderView *headerView;
@property (nonatomic, strong) GLSegment *segment;

@end

@implementation GoodsDetailViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.goodsDetailTableView];
    //添加导航条按钮
    [self loadBtnWithFrame:(CGRect){20, 20, 36, 36} withBtnImageName:@"nav-back-icon" withAction:@selector(backBtn)];
    [self loadBtnWithFrame:(CGRect){W - 56, 20, 36, 36} withBtnImageName:@"nav-cart-icon" withAction:@selector(backBtn)];
    //加载底部button
    [self loadBottomBtn];

}
//懒加载
- (UITableView *)goodsDetailTableView
{
    if (!_goodsDetailTableView) {
        self.goodsDetailTableView = [[UITableView alloc] initWithFrame:(CGRect){0, -20 , W, H + 20} style:UITableViewStylePlain];
        
        self.goodsDetailTableView.delegate = self;
        self.goodsDetailTableView.dataSource = self;
        
        self.goodsDetailTableView.allowsSelection = NO;
        
        _headerView = [[[NSBundle mainBundle] loadNibNamed:@"GoodsDetailHeaderView" owner:nil options:nil] lastObject];
        self.goodsDetailTableView.tableHeaderView = _headerView;
        
        [self.goodsDetailTableView registerNib:[UINib nibWithNibName:@"GoodsDetailCell" bundle:nil] forCellReuseIdentifier:@"goodsDetail"];
        
        [self.goodsDetailTableView registerNib:[UINib nibWithNibName:@"CommentCell" bundle:nil] forCellReuseIdentifier:@"comment"];

        [self loadSegment];

    }
    return _goodsDetailTableView;
}

#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (self.segment.selectIdx == 0) {
        GoodsDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goodsDetail" forIndexPath:indexPath];

        cell.backgroundColor = [UIColor greenColor];
        return cell;
    }else{
        CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"comment" forIndexPath:indexPath];

        return cell;
    }
    
}
#pragma mark -- UITableViewDelegate
//把segment设为section的头
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.segment;
}
//返回section头的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}

//初始化segment
- (GLSegment *)loadSegment{
    
    GLSegment *segment = [[GLSegment alloc] initWithFrame:(CGRect){0, 0, W, 30} withItems:@[@"商品详情", @"用户评价"]];
    
    //设置segment背景颜色
    segment.segmentBgColor = [UIColor whiteColor];
    
    //设置模块没有被点击的字体颜色
    segment.defaultPerColor = [UIColor blackColor];
    
    //设置选中的模块的字体颜色
    segment.perColor = Animalcolor;
    
    //设置下划线的背景颜色
    segment.underLayerBackgroudColor = [UIColor redColor];
    
    //设置选中的索引
    segment.selectIdx = 0;
    
    self.segment = segment;
    //反向传值并重新加载cell
    __weak typeof(self) mySelf = self;
    self.segment.changeDirection = ^(NSInteger a){
        mySelf.segment.selectIdx = a;
        [mySelf.goodsDetailTableView reloadData];
    };
    return segment;
}
//加载导航栏Button的方法
- (void)loadBtnWithFrame:(CGRect)frame withBtnImageName:(NSString *)ImageName withAction:(SEL)action
{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    [btn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    btn.layer.cornerRadius = 18;
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
//加载底部按钮的方法
- (void) loadBottomBtn
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundImage:[UIImage imageNamed:@"nav-cart-icon"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(shopCart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    __weak typeof(self) mySelf = self;
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@44);
        make.width.mas_equalTo(@44);
        make.left.mas_equalTo(mySelf.view.mas_left).with.offset(0);
        make.bottom.mas_equalTo(mySelf.view.mas_bottom).with.offset(0);
    }];
    btn.backgroundColor = [UIColor cyanColor];
    
    UIButton *btn2 = [[UIButton alloc] init];
    UIButton *btn3 = [[UIButton alloc] init];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"one"] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(addGoodsInShopCart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    [self.view addSubview:btn3];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@44);
        make.left.mas_equalTo(btn.mas_right).with.offset(0);
        make.bottom.mas_equalTo(mySelf.view.mas_bottom).with.offset(0);
        make.width.equalTo(btn3.mas_width);
    }];
    btn2.backgroundColor = [UIColor redColor];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"one"] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(buyGoods) forControlEvents:UIControlEventTouchUpInside];
    btn3.backgroundColor = [UIColor blackColor];
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@44);
        make.width.equalTo(btn2.mas_width);
        make.left.mas_equalTo(btn2.mas_right).with.offset(0);
        make.bottom.mas_equalTo(mySelf.view.mas_bottom).with.offset(0);
        make.right.mas_equalTo(mySelf.view.mas_right).with.offset(0);
    }];
}

#pragma mark -- button`s Action
//返回按钮的方法
- (void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden = NO;
}
//购物车按钮的方法
- (void)shopCart
{
    ShopCartViewController *vc = [[ShopCartViewController alloc] init];
    vc.view.backgroundColor = Animalcolor;
    [self pushViewControllerWithTabBarHidden:vc];
}
//加入购物车的方法
- (void)addGoodsInShopCart
{
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.labelText = @"亲，已加入购物车！";
    HUD.color = [UIColor grayColor];
    HUD.mode = MBProgressHUDModeCustomView;
    [HUD hide:YES afterDelay:1.5];
    
    
}
//立即购买的方法
- (void)buyGoods
{
    NSLog(@"立即购买");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
