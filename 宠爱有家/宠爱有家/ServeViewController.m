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
#import "FujinView.h"
#import "YCViewController.h"
#import "UIViewController+PushViewControllerWithBarHidden.h"
#import "UIViewController+addLeftOrRightBarButton.h"
@interface ServeViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating,UISearchControllerDelegate>


@property (nonatomic, strong)NSMutableArray  *filteredArray;

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic ,strong) UISearchController *SearchController;

@property (nonatomic ,strong) YCSegment *segment;

@property (nonatomic ,strong) UIView *MyView;

@property (nonatomic ,strong) FujinView *fujin;
@property (nonatomic ,strong) YCView *ycView;

//数据源

@property (nonatomic , strong)NSMutableArray *dataList;
@property (nonatomic , strong)NSMutableArray *searchList;

@end

@implementation ServeViewController

- (void)SeeMoreAct
{
    [self pushViewControllerWithTabBarHidden:[[YCViewController alloc] init]];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"服务";
    
    
    [self addRightBtnImageName:@"dian" action:@selector(SeeMoreAct)];

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W , H) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.85 alpha:1];
    
//    //可以清除cell之间的白线
//    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    [self.view addSubview:self.tableView];
    
    self.MyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, W, H - 108)];
    self.tableView.tableHeaderView = self.MyView;
    
   
    

    
    self.SearchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    
    //设置开始搜索时背景显示与否
    self.SearchController.dimsBackgroundDuringPresentation = NO;
    
    self.SearchController.hidesNavigationBarDuringPresentation = NO;
    
    self.SearchController.hidesNavigationBarDuringPresentation = NO;
    
    self.SearchController.searchBar.frame = CGRectMake(0,0,W,40);
    //设置代理
     self.SearchController.delegate = self;
     self.SearchController.searchResultsUpdater= self;

    

    [self.MyView addSubview:self.SearchController.searchBar];
    
    YCSegment *segment = [[YCSegment alloc] initWithFrame:CGRectMake(0, 40, W , 30) withItems:@[@"全部",@"洗护",@"造型",@"绝育",@"寄养",@"体检",@"医疗"]];
    segment.segmentBgColor = [UIColor whiteColor];
    segment.defaultPerColor = [UIColor blackColor];
    segment.perColor = [UIColor redColor];
    segment.underLayerBackgroudColor = [UIColor redColor];
    segment.selectIdx = 0;
    
    [self.MyView addSubview:segment];
    
   
//    NSString *inden = @"YMCView";
//
//    _ycView = kLoadViewWithNIB(inden);
//
//    _ycView.backgroundColor = [UIColor colorWithWhite:0.85 alpha:1];
//   
//    _ycView.frame = (CGRect){0, 90 ,   W,  H - 258};
//    [self.MyView addSubview:_ycView];
//    
    
    NSString *indenone = @"FujinView";
    
    _fujin = kLoadViewWithNIB(indenone);
    
    _fujin.backgroundColor = [UIColor whiteColor];
    
    _fujin.frame = (CGRect){0, H - 140, W , 30};
    
    
    [self.MyView addSubview:_fujin];
  
    _dataList = [NSMutableArray array];
    _searchList = [NSMutableArray array];
    self.dataList=[NSMutableArray arrayWithCapacity:100];
    
    //产生100个“数字+三个随机字母”
    for (NSInteger i=0; i<100; i++) {
        [self.dataList addObject:[NSString stringWithFormat:@"%ld%@",(long)i,[self shuffledAlphabet]]];
    }

    NSLog(@"%@",_dataList);
}

- (NSString *)shuffledAlphabet {
    NSMutableArray *shuffedAlphabet = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"]];
    NSString *strTest = [[NSString alloc] init];
    for (int i = 0 ; i < 3; i++)
    {
        int x = arc4random() % 25;
        strTest = [NSString stringWithFormat:@"%@%@",strTest,shuffedAlphabet[x]];
    }
    return strTest;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.SearchController.active) {
        return [self.searchList count];
    }else{
        return [self.dataList count];
    }

}
//设置区域的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0)
    {
        return CGFLOAT_MIN;
    }
    else{
    return 5;
    }
}



//返回显示cell内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *iii = @"YCCell";
    YCCell *cell =[tableView dequeueReusableCellWithIdentifier:iii];
    if (!cell){
        cell = kLoadViewWithNIB(iii);
    }
    
    if (self.SearchController.active) {
        cell.NameLable.text = self.searchList[indexPath.section];
       
//    [cell.NameLable setText:self.searchList[indexPath.row]];
        
    }
    else{
         cell.NameLable.text = self.dataList[indexPath.section];

    }

    return cell;
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSLog(@"updateSearchResultsForSearchController");
    NSString *searchString = [self.SearchController.searchBar text];
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
    if (self.searchList!= nil) {
        [self.searchList removeAllObjects];
    }
    //过滤数据
    self.searchList= [NSMutableArray arrayWithArray:[_dataList filteredArrayUsingPredicate:preicate]];
    //刷新表格
    [self.tableView reloadData];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 114;
}


@end
