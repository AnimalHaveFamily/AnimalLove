//
//  ServeViewController.m
//  宠爱有家
//
//  Created by XXXX on 16/5/5.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "ServeViewController.h"
#import "YCSegment.h"
#import "YCView.h"
#import "YCCell.h"

@interface ServeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)NSMutableArray  *dataArr;

@property (nonatomic, strong)NSMutableArray  *searchArr;

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic ,strong) UISearchController *SearchController;

@property (nonatomic ,strong) YCSegment *segment;

@property (nonatomic ,strong) UIView *MyView;



@property (nonatomic ,strong) YCView *ycView;
@end

@implementation ServeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"服务";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W , H) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.85 alpha:1];
    
    
    
    
    [self.view addSubview:self.tableView];
    
    
    self.dataArr=[NSMutableArray arrayWithCapacity:100];
    
    for (NSInteger i=0; i<100; i++) {
        [self.dataArr addObject:[NSString stringWithFormat:@"%ld",(long)i]];
    }
    
    
    self.MyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, W, H - 108)];
    self.tableView.tableHeaderView = self.MyView;
    [self.tableView registerNib:[UINib nibWithNibName:@"YCCell" bundle:nil] forCellReuseIdentifier:@"YCCell"];
    

    
    self.SearchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    
    //设置开始搜索时背景显示与否
    self.SearchController.dimsBackgroundDuringPresentation = NO;
    
    self.SearchController.hidesNavigationBarDuringPresentation = NO;
    
    self.SearchController.hidesNavigationBarDuringPresentation = NO;
    
    self.SearchController.searchBar.frame = CGRectMake(0,0,W,40);
    
    

    [self.MyView addSubview:self.SearchController.searchBar];
    
    YCSegment *segment = [[YCSegment alloc] initWithFrame:CGRectMake(0, 40, W , 30) withItems:@[@"全部",@"洗护",@"造型",@"绝育",@"寄养",@"体检",@"医疗"]];
    segment.segmentBgColor = [UIColor whiteColor];
    segment.defaultPerColor = [UIColor blackColor];
    segment.perColor = [UIColor redColor];
    segment.underLayerBackgroudColor = [UIColor redColor];
    segment.selectIdx = 0;
    
    [self.MyView addSubview:segment];
    
   

    _ycView = [[[NSBundle mainBundle] loadNibNamed:@"YCView" owner:nil options:nil] lastObject];
    _ycView.backgroundColor = [UIColor colorWithWhite:0.85 alpha:1];
   
    _ycView.frame = (CGRect){0, 110 ,   W,  H - 258};
    [self.MyView addSubview:_ycView];
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
