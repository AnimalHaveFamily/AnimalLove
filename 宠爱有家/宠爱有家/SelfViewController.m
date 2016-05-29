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
#import "UIImageView+WebCache.h"

#import "UIButton+WebCache.h"


@interface SelfViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *selfTableView;
@property (nonatomic,strong)AnimalSigle *singel;
@end

@implementation SelfViewController


- (void)viewWillAppear:(BOOL)animated{
    
    _singel = [AnimalSigle SelfMessage];
    
    selfHeadView *headview = [[[NSBundle mainBundle] loadNibNamed:@"selfHeadView" owner:nil options:nil] lastObject];
    if (_singel.username) {
        
        [headview.loginBtn setTitle:@"登陆/注册" forState:UIControlStateNormal];
        if (![_singel.username isEqualToString:@""]) {
            [headview.loginBtn setTitle:_singel.username forState:UIControlStateNormal];
            [headview.headButton sd_setImageWithURL:[NSURL URLWithString:_singel.headPhoto] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"QQ-1"]];
        }
    }
    
    _selfTableView.tableHeaderView = headview;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addRightBtnImageName:@"nav_news_icon" action:@selector(setAction)];
   
    self.navigationItem.title = @"我的";
    
    _selfTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W, H) style:UITableViewStylePlain];
    _selfTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    
      NSLog(@"_singel.username == %@",_singel.username);
    
    
    if ([_singel.username isEqualToString:@""] || !_singel.username) {
        LoginController *login = [[LoginController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:login];
        [self presentViewController:nav animated:YES completion:nil];
    }
    else
    {
    
   
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    InformationController *informationVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"InformationController"];

    [self pushViewControllerWithTabBarHidden:informationVC];
    }
    
}



- (void)setAction{
    
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
