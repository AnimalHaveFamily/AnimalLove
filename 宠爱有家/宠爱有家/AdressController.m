//
//  AdressController.m
//  宠爱有家
//
//  Created by XXXX on 16/5/19.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "AdressController.h"
#import "UIViewController+addLeftOrRightBarButton.h"
#import "AddPeopleController.h"
#import "UIViewController+PushViewControllerWithBarHidden.h"
#import "MainTableViewCell.h"

@interface AdressController ()<UITableViewDataSource,UITableViewDelegate,KeepControlDelegate>
{
    
    AddPeopleController *addPeoVC;
}
@property (nonatomic,strong)UITableView *MainTableView;
@property (nonatomic,strong)NSMutableArray *SaveArr;
@property (nonatomic ,strong)MainTableViewCell *cell;

@end

@implementation AdressController


- (void)AddMessage:(NSMutableDictionary *)dic{
    
    [_SaveArr addObject:dic];
    [self.MainTableView reloadData];
    
}
- (void)viewWillAppear:(BOOL)animated{
    

    if (_SaveArr.count == 0) {
        self.view = [[[NSBundle mainBundle] loadNibNamed:@"AdressNoMessageView" owner:nil options:nil] lastObject];
    }
    
    if (_SaveArr.count != 0) {
        _MainTableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 64 + 10, W - 20, H) style:UITableViewStylePlain];
        _MainTableView.dataSource = self;
        _MainTableView.delegate = self;
            _MainTableView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
        [self.view addSubview:_MainTableView];
        
        [_MainTableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier:@"MainCell"];

    }
 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _SaveArr = [[NSMutableArray alloc] initWithCapacity:0];
    

    self.navigationItem.title = @"收货人信息";
    
    [self addRightBtnImageName:@"one" action:@selector(addNewAdressAction)];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
  
    
}


#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    _cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
   
    
    _cell.NameLab.text = [_SaveArr[indexPath.section] objectForKey:@"name"];
    _cell.countryLab.text = [_SaveArr[indexPath.section] objectForKey:@"place"];
    
    _cell.phoneLab.text = [_SaveArr[indexPath.section] objectForKey:@"number"];
 
    return _cell;
}



#pragma mark -- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath

{
    return 95;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return _SaveArr.count;
}

- (void)addNewAdressAction{
    addPeoVC = [[AddPeopleController alloc] init];
    
    addPeoVC.delegate = self;
    [self pushViewControllerWithTabBarHidden:addPeoVC];
    self.hidesBottomBarWhenPushed = YES;
  
  
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
