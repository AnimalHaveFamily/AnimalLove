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
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface LocationViewController ()<UITableViewDelegate, UITableViewDataSource,UIScrollViewDelegate,CLLocationManagerDelegate>
{
    LocationTableCell *cell;
    LocationHeadView *headview;
    
}

@property (nonatomic ,strong)CLLocationManager *locationManager;
@property (nonatomic ,strong)UITableView *LocationTableView;
@property (nonatomic ,strong)NSMutableArray *CityArr;
@property (nonatomic ,strong)NSMutableArray *MainArr;



@end

@implementation LocationViewController

sqlite3 *_db = NULL;

- (CLLocationManager *)locationManager{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        
    }
    return _locationManager;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"选择地区";
    
    self.locationManager.delegate = self;
    
    [self.locationManager startUpdatingLocation];//开启定位

    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"没有获取位置信息的设备");
        return;
    }
    

    [self addLeftBtnImageName:@"nav_search_icon" action:@selector(BackAction)];
    _MainArr = [[NSMutableArray alloc] initWithCapacity:0];
    
 
    _LocationTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0 ,W , H) style:UITableViewStyleGrouped];
    _LocationTableView.delegate = self;
    _LocationTableView.dataSource = self;
    [self.view addSubview:_LocationTableView];
   
    
    [self setHeadView];
    [self CreatSqlite];
    
    [_LocationTableView registerNib:[UINib nibWithNibName:@"LocationTableCell" bundle:nil] forCellReuseIdentifier:@"Locationcell"];

#ifdef __IPHONE_8_0
    
    [_locationManager requestAlwaysAuthorization];
#else
    [_locationManager startUpdatingLocation];
#endif
    
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations{
    
//    NSLog(@"经度＝%f",((CLLocation *)[locations lastObject]).coordinate.longitude);
//    
//    NSLog(@"纬度＝%f",((CLLocation *)[locations lastObject]).coordinate.latitude);

    //地理位置反编码
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:[locations lastObject] completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0) {
            CLPlacemark *placeMark = [placemarks objectAtIndex:0];
//            NSLog(@"详细地址 = %@",placeMark.name);
            
            headview.nowLocation.text = placeMark.name;
            NSString *city = placeMark.locality;
            if (!city) {
                city = placeMark.administrativeArea;
            }
            NSLog(@"city = %@",city);
            [headview.nowButton setTitle:city forState:UIControlStateNormal];
        }
        
        /*
        [placemarks enumerateObjectsUsingBlock:^(CLPlacemark * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"%@",obj.locality);
        }];
         */
        
    }];
    
    [manager stopUpdatingLocation];
}


- (void)setHeadView{
    headview = [[[NSBundle mainBundle] loadNibNamed:@"LocationHeadView" owner:nil options:nil] lastObject];
    
    _LocationTableView.tableHeaderView = headview;
    
    typeof(self) myself = self;
    headview.LocationBlock = ^(NSString *str){
        [myself dismissViewControllerAnimated:YES completion:nil];
        myself.MyBlock(str);
        
    };
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}

-(nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *tempDict = _MainArr[section];
    NSString *proName = [tempDict objectForKey:@"proName"];
    return proName;
}

//设置组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _MainArr.count;
}

//设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    NSDictionary *tempDict = _MainArr[section];
    NSArray *cityAr = [tempDict objectForKey:@"cityAry"];
    return cityAr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    cell = [tableView dequeueReusableCellWithIdentifier:@"Locationcell"];
    NSDictionary *tempDict = _MainArr[indexPath.section];
    NSArray *cityAry = [tempDict objectForKey:@"cityAry"];
    NSString *cityName = cityAry[indexPath.row];
    cell.cityLable.text = cityName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{

    NSArray *arr = [_MainArr[indexPath.section] objectForKey:@"cityAry"];
    NSString *cityStr = arr[indexPath.row];
    self.MyBlock(cityStr);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)CreatSqlite{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [paths firstObject];
    NSString *sqlithPath = [documentPath stringByAppendingPathComponent:@"my.sqlite"];
    //沙盒路径
    
    
    NSString *dapath = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"sqlite"];
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    NSError *error;
    if (![filemanager fileExistsAtPath:sqlithPath]) {
        NSLog(@"%@",dapath);
        if ([filemanager copyItemAtPath:dapath toPath:sqlithPath error:&error]) {
            NSLog(@"拷贝成功");
        }
    }
 
    int open = sqlite3_open(sqlithPath.UTF8String, &_db);
    if (open == SQLITE_OK) {
        NSLog(@"打开成功");
        
    }
    
    char *selectProvinceStr = "select * from T_Province";
    
    
    sqlite3_stmt *proStmt = NULL;
    sqlite3_stmt *cityStmt = NULL;
    
    int temp = sqlite3_prepare_v2(_db, selectProvinceStr, -1, &proStmt, NULL);
    //省份查询
    if (temp == SQLITE_OK)
    {
        while (sqlite3_step(proStmt) == SQLITE_ROW) {
            NSMutableDictionary *proDict = [NSMutableDictionary new];
            char *proChar = (char *)sqlite3_column_text(proStmt, 0);
            //0代表该表里面的第1列
            
            NSString *proName = [NSString stringWithUTF8String:proChar];
            
            
            [proDict setObject:proName forKey:@"proName"];
            
            char *proIdChar = (char *)sqlite3_column_text(proStmt, 1);
            //1代表该表里面的第2列
            
            NSString *proIdStr =[NSString stringWithUTF8String:proIdChar];
            
            //            NSLog(@"proIdStr == %@",proIdStr);
            
            
            //市区查询
            NSString *str = [NSString stringWithFormat:@"select CityName from T_City where ProID = %@",proIdStr];
            const char *selectCitySql = str.UTF8String;
            int perpare = sqlite3_prepare_v2(_db, selectCitySql, -1, &cityStmt, NULL);
            _CityArr = [[NSMutableArray alloc] initWithCapacity:0];
            //因为每个省都有一个数组，如果放到上面初始化，会把所有的都加载在一个数组里面
            if (perpare == SQLITE_OK) {
                //sqlite3_step：按照顺序执行
                //SQLITE_ROW：是一个合法可执行状态
                while (sqlite3_step(cityStmt) == SQLITE_ROW) {
                    
                    char *_id = (char *)sqlite3_column_text(cityStmt, 0);
                    NSString *str = [NSString stringWithUTF8String:_id];
                    
                    [_CityArr addObject:str];
                    [proDict setObject:_CityArr forKey:@"cityAry"];
                }
            }
            [_MainArr addObject:proDict];
        }
        //别忘了结束结果集合
        sqlite3_finalize(cityStmt);
        sqlite3_finalize(proStmt);
    }

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
