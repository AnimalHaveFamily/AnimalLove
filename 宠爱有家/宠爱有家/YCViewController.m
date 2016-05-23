//
//  YCViewController.m
//  宠爱有家
//
//  Created by ymcgz on 16/5/18.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "YCViewController.h"
#import "JiBieView.h"
#import "YCCell.h"
@interface YCViewController ()<WSDropMenuViewDataSource,WSDropMenuViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSArray *LeiXingArray;
    NSArray *LeiXingArrayTwo;
    NSArray *LeiXingArrayThird;
    NSArray *LiArray;
}
@property (nonatomic ,strong) UITableView *YcTableView;
@end

@implementation YCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"商店列表";
//    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];

    _YcTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, W , H - 100) style:UITableViewStylePlain];
    _YcTableView.dataSource = self;
    _YcTableView.delegate = self;
    [self.view addSubview:_YcTableView];
    
    [self.YcTableView registerNib:[UINib nibWithNibName:@"YCCell" bundle:nil] forCellReuseIdentifier:@"YCCell"];

    
    
    WSDropMenuView *dropMenu = [[WSDropMenuView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 40)];
    dropMenu.dataSource = self;
    dropMenu.delegate  =self;
    [self.view addSubview:dropMenu];
    
    LeiXingArray = @[@"全部分类", @"猫猫服务", @"狗狗服务",@"其它动物"];
    LeiXingArrayTwo = @[@"萌宠全部服务", @"萌宠洗护", @"萌宠造型",@"萌宠绝育",@"萌宠寄养", @"萌宠体检", @"萌宠医疗",@"萌宠摄影", @"萌宠训练"];

    LeiXingArrayThird = @[@"皇室",@"优质",@"普通"];
    
    LiArray = @[@"离我最近",@"认证商户",@"人气由高到低",@"明星商户"];
    
    
    
   
}


#pragma mark - WSDropMenuView DataSource -
- (NSInteger)dropMenuView:(WSDropMenuView *)dropMenuView numberWithIndexPath:(WSIndexPath *)indexPath{
    
    //WSIndexPath 类里面有注释
    
    if (indexPath.column == 0 && indexPath.row == WSNoFound) {
        
        return 4;
    }
    if (indexPath.column == 0 && indexPath.row != WSNoFound && indexPath.item == WSNoFound) {
        
        return 9;
    }
    
    if (indexPath.column == 0 && indexPath.row != WSNoFound && indexPath.item != WSNoFound && indexPath.rank == WSNoFound) {
        
        return 3;
    }
    
    if (indexPath.column == 1) {
        
        return 4;
    }
    
    return 0;
}

- (NSString *)dropMenuView:(WSDropMenuView *)dropMenuView titleWithIndexPath:(WSIndexPath *)indexPath{
    
    //return [NSString stringWithFormat:@"%ld",indexPath.row];
    
    //左边 第一级
    if (indexPath.column == 0 && indexPath.row != WSNoFound && indexPath.item == WSNoFound) {
        return LeiXingArray[indexPath.row];
        }
    
    if (indexPath.column == 0 && indexPath.row != WSNoFound && indexPath.item != WSNoFound && indexPath.rank == WSNoFound) {
        
        return LeiXingArrayTwo[indexPath.item];
    }
    
    if (indexPath.column == 0 && indexPath.row != WSNoFound && indexPath.item != WSNoFound && indexPath.rank != WSNoFound) {
        
        return LeiXingArrayThird[indexPath.rank];
    }
    
    if (indexPath.column == 1 && indexPath.row != WSNoFound ) {
        
        return LiArray[indexPath.row];
    }
    
    
    return @"";
    
}

#pragma mark - WSDropMenuView Delegate -

- (void)dropMenuView:(WSDropMenuView *)dropMenuView didSelectWithIndexPath:(WSIndexPath *)indexPath{
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 30;
}
//设置区域的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}



//返回显示cell内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YCCell *cell =[tableView dequeueReusableCellWithIdentifier:@"YCCell" forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 114;
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
