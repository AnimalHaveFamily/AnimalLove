//
//  SelfViewController.m
//  宠爱有家
//
//  Created by XXXX on 16/5/5.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "SelfViewController.h"
#import "LoginController.h"
#import "UIViewController+addLeftOrRightBarButton.h"
#import "selfTableViewCell.h"
#import "InformationController.h"
#import "UIViewController+PushViewControllerWithBarHidden.h"
#import "selfHeadView.h"
#import "AnimalSigle.h"

@interface SelfViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *selfTableView;
@end

@implementation SelfViewController


- (void)viewWillAppear:(BOOL)animated{
    
    AnimalSigle *singel = [AnimalSigle SelfMessage];
    
    selfHeadView *headview = [[[NSBundle mainBundle] loadNibNamed:@"selfHeadView" owner:nil options:nil] lastObject];
    if (![singel.username isEqualToString:@""]) {
        [headview.loginBtn setTitle:singel.username forState:UIControlStateNormal];
    }
    _selfTableView.tableHeaderView = headview;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addRightBtnImageName:@"nav_news_icon" action:@selector(setAction)];
   
    self.navigationItem.title = @"我的";
    
    _selfTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _selfTableView.dataSource = self;
    _selfTableView.delegate = self;
    _selfTableView.bounces = NO;
    [self.view addSubview:_selfTableView];
    
    [_selfTableView registerNib:[UINib nibWithNibName:@"selfTableViewCell" bundle:nil] forCellReuseIdentifier:@"selfcell"];

    

    
    
}


#pragma mark -- UITbaleViewDatasourse

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }
    else return 2;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    selfTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"selfcell"];
    NSArray *arr = @[@"个人资料",@"我的订单",@"我的收藏",@"我的优惠券",@"消息中心",@"在线客服",];
    cell.textLabel.text = arr[indexPath.row];
    return cell;

}


#pragma mark -- UITbaleViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
//设置组数

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    InformationController *informationVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"InformationController"];

    [self pushViewControllerWithTabBarHidden:informationVC];
    
}



- (void)setAction{
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    
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
