//
//  ShopCartViewController.m
//  宠爱有家
//
//  Created by scjy on 16/5/16.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "ShopCartViewController.h"
#import "ShopCartCell.h"
#import "UIViewController+PushViewControllerWithBarHidden.h"
#import "GoodsDetailViewController.h"
#import "Masonry.h"
#import "UIButton+layerBorder.h"
#import "UIViewController+addLeftOrRightBarButton.h"
@interface ShopCartViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UILabel *_label2;
    UILabel *_label3;
    NSMutableArray *cellArr;
}
@property (nonatomic, strong) UITableView *shopCartTableView;
@end

static float number = 0;
@implementation ShopCartViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"购物车";
    [self addRightBtnTitle:@"删除" action:@selector(deleteAction)];
    [self.view addSubview:self.shopCartTableView];
    
    [self loadBottomView];
}
//懒加载
- (UITableView *)shopCartTableView
{
    if (!_shopCartTableView) {
        _shopCartTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        [_shopCartTableView registerNib:[UINib nibWithNibName:@"ShopCartCell" bundle:nil] forCellReuseIdentifier:@"shopCartCell"];
        _shopCartTableView.delegate = self;
        _shopCartTableView.dataSource = self;
        _shopCartTableView.allowsSelection = NO;
        
    }
    return _shopCartTableView;
}

#pragma mark -- UITableViewDataSource
//返回每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopCartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopCartCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) mySelf = self;
    cell.push = ^(){
        GoodsDetailViewController *vc = [[GoodsDetailViewController alloc] init];
        [mySelf pushViewControllerWithTabBarHidden:vc];
    };


    cell.backValue = ^(float a){
        number += a;
        _label2.text = [NSString stringWithFormat:@"合计：¥%.2f",number];
    };
    
    cellArr = [[NSMutableArray alloc] init];
    [cellArr addObject:cell];
    return cell;
}
#pragma mark -- UITableViewDelegate
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 147;
}

- (void)loadBottomView
{
    __weak typeof(self) mySelf = self;
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    bottomView.layer.borderWidth = 0.5;
    bottomView.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:bottomView];

    UIButton *btn = [[UIButton alloc] init];
    [bottomView addSubview:btn];
    UILabel *label1 = [[UILabel alloc] init];
    [bottomView addSubview:label1];
    _label2 = [[UILabel alloc] init];
    [bottomView addSubview:_label2];
    _label3 = [[UILabel alloc] init];
    _label3.backgroundColor = [UIColor blackColor];
    [bottomView addSubview:_label3];
    UIButton *btn2 = [[UIButton alloc] init];
    [bottomView addSubview:btn2];

    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@44);
        make.right.mas_equalTo(mySelf.view.mas_right).with.offset(0);
        make.left.mas_equalTo(mySelf.view.mas_left).with.offset(0);
        make.bottom.mas_equalTo(mySelf.view.mas_bottom).with.offset(0);
    }];
    
    //全选btn的方法
    [btn addTarget:self action:@selector(selectAllGoods) forControlEvents:UIControlEventTouchUpInside];
    
    [btn addBorderWidth:1 borderColor:[UIColor blackColor]];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@20);
        make.width.mas_equalTo(@20);
        make.left.mas_equalTo(bottomView.mas_left).with.offset(10);
        make.centerY.equalTo(bottomView.mas_centerY);
    }];
    
    label1.text = @"全选";
    label1.textColor = [UIColor blackColor];
    label1.textAlignment = NSTextAlignmentLeft;
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@44);
        make.width.mas_equalTo(@40);
        make.left.mas_equalTo(btn.mas_right).with.offset(10);
        make.centerY.equalTo(bottomView.mas_centerY);
    }];
    _label2.text = @"合计：¥0.00";
    _label2.textColor = [UIColor blackColor];
    _label2.textAlignment = NSTextAlignmentRight;
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@44);
        make.right.mas_equalTo(_label3.mas_left).with.offset(-10);
        make.left.mas_equalTo(label1.mas_right).with.offset(0);
        make.centerY.equalTo(bottomView.mas_centerY);
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@44);
        make.width.mas_equalTo(@1);
        make.right.mas_equalTo(btn2.mas_left).with.offset(0);

        make.centerY.equalTo(bottomView.mas_centerY);
    }];
    //结算btn的方法
    [btn2 addTarget:self action:@selector(accountAllGoods) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTitle:@"结算" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn2.backgroundColor = Animalcolor;
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@44);
        make.width.mas_equalTo(@100);
        make.left.mas_equalTo(_label3.mas_right).with.offset(0);
        make.right.mas_equalTo(bottomView.mas_right).with.offset(0);
        make.centerY.equalTo(bottomView.mas_centerY);
    }];

}
//删除按钮的方法
- (void)deleteAction
{
    
}
//全选按钮的方法
- (void)selectAllGoods
{
    NSLog(@"全选了商品");
    for (ShopCartCell *cell in cellArr) {
        cell.isSelected = YES;
    }
    
}
//结算按钮的方法
- (void)accountAllGoods
{
    NSLog(@"结算了商品");
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
