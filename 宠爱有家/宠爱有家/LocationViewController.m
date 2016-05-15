//
//  LocationViewController.m
//  宠爱有家
//
//  Created by XXXX on 16/5/11.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "LocationViewController.h"
#import "UIViewController+addLeftOrRightBarButton.h"
#import "LocationTableCell.h"
#import "LocationHeadView.h"
#import <sqlite3.h>


@interface LocationViewController ()<UITableViewDelegate, UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic ,strong)UITableView *LocationTableView;
@property (nonatomic ,strong)NSMutableArray *CityArr;


@end

@implementation LocationViewController

sqlite3 *_db = NULL;

- (NSMutableArray *)CityArr{
    if (!_CityArr) {
        _CityArr = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _CityArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"选择地区";
    
    [self addLeftBtnImageName:@"nav_search_icon" action:@selector(BackAction)];
    
    
 
    _LocationTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0 ,W , H) style:UITableViewStyleGrouped];
    _LocationTableView.delegate = self;
    _LocationTableView.dataSource = self;
    [self.view addSubview:_LocationTableView];
    
  
    [self setHeadView];
    
    [_LocationTableView registerNib:[UINib nibWithNibName:@"LocationTableCell" bundle:nil] forCellReuseIdentifier:@"Locationcell"];
    
    NSString *filePath = @"/Users/xxxx/Desktop/AnimalLove/宠爱有家/city.sqlite";
    
    
    
    int open = sqlite3_open(filePath.UTF8String, &_db);
    if (open == SQLITE_OK) {
        NSLog(@"打开成功");
    
    }
    
    char *sql = "select CityName from T_City where ProID = 16";
    sqlite3_stmt *stmt = NULL;
    
    
    int perpare = sqlite3_prepare_v2(_db, sql, -1, &stmt, NULL);
    
    
    if (perpare == SQLITE_OK) {
        NSLog(@"查询成功");
        
        //sqlite3_step：按照顺序执行
        //SQLITE_ROW：是一个合法可执行状态
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
            //获取结果集中所对应的值，0是对应的列
            //代表的是设置的查询条件的顺序
            

            char *_id = (char *)sqlite3_column_text(stmt, 0);
            
            NSString *str = [NSString stringWithUTF8String:_id];
            
            [_CityArr addObject:str];
            
           
        }
    }
    //别忘了结束结果集合
    sqlite3_finalize(stmt);
}

- (void)setHeadView{
    LocationHeadView *headview = [[[NSBundle mainBundle] loadNibNamed:@"LocationHeadView" owner:nil options:nil] lastObject];
    _LocationTableView.tableHeaderView = headview;
    
    headview.LocationBlock = ^(NSString *str){
        [self dismissViewControllerAnimated:YES completion:nil];
        self.MyBlock(str);
        
    };
}


-(nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @[@"第一组",@"第二组",@"第三组",@"第四组",@"第五组",@"第一组",@"第二组",@"第三组",@"第四组",@"第五组"][section];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 25;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LocationTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Locationcell"];
    
    cell.textLabel.text = _CityArr[indexPath.row];
    return cell;
    
    
}

- (void)BackAction{
    [self dismissViewControllerAnimated:YES completion:nil];
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
