//
//  ServeViewController.m
//  宠爱有家
//
//  Created by XXXX on 16/5/5.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "ServeViewController.h"
#import "YCSegment.h"
#define kTableCell @tablecell


@interface ServeViewController ()<UITableViewDataSource,UISearchResultsUpdating,UISearchBarDelegate>

@property (nonatomic, strong)NSMutableArray  *dataArr;

@property (nonatomic, strong)NSMutableArray  *searchArr;

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic ,strong) UISearchController *SearchController;

@property (nonatomic ,strong) YCSegment *segment;

@property (nonatomic ,strong) UIView *MyView;
@end

@implementation ServeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"服务";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W , H) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    
    self.dataArr=[NSMutableArray arrayWithCapacity:100];
    
    for (NSInteger i=0; i<100; i++) {
        [self.dataArr addObject:[NSString stringWithFormat:@"%ld",(long)i]];
    }
    
    self.MyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, W, 300)];
    self.tableView.tableHeaderView = self.MyView;
    
    

    
    self.SearchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    
    //设置开始搜索时背景显示与否
    self.SearchController.dimsBackgroundDuringPresentation = NO;
    
    self.SearchController.hidesNavigationBarDuringPresentation = NO;
    
    self.SearchController.searchBar.frame = CGRectMake(0,0,W,30);

    [self.MyView addSubview:self.SearchController.searchBar];
    
    YCSegment *segment = [[YCSegment alloc] initWithFrame:CGRectMake(0, 30, W , 40) withItems:@[@"全部",@"洗护",@"造型",@"绝育",@"寄养",@"体检",@"医疗"]];
    segment.segmentBgColor = [UIColor whiteColor];
    segment.defaultPerColor = [UIColor blackColor];
    segment.perColor = [UIColor redColor];
    segment.underLayerBackgroudColor = [UIColor redColor];
    segment.selectIdx = 0;
    
    [self.MyView addSubview:segment];

    
}

//设置区域的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (self.SearchController.active) {
        return [self.searchArr count];
    }else{
        return [self.dataArr count];
    }
    
}

//返回显示cell内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *indentifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    
    
    if (self.SearchController.active) {
        [cell.textLabel setText:self.searchArr[indexPath.row]];
            }
    else{
        [cell.textLabel setText:self.dataArr[indexPath.row]];
        
    }
    return cell;
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSString *searchString = [self.SearchController.searchBar text];
    
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
    
    if (self.searchArr!= nil) {
        
        [self.searchArr removeAllObjects];
        
        NSLog(@"#####");
    }
    
    //过滤数据
    self.searchArr= [NSMutableArray arrayWithArray:[self.dataArr filteredArrayUsingPredicate:preicate]];
    
    //刷新表格
    [self.tableView reloadData];
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
