//
//  AnimalTabar.m
//  宠爱有家
//
//  Created by XXXX on 16/5/5.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "AnimalTabar.h"
#import "MainViewController.h"
#import "ShopViewController.h"
#import "ServeViewController.h"
#import "SelfViewController.h"

@interface AnimalTabar ()

@end

@implementation AnimalTabar



- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.tintColor = Animalcolor;

    
    [self addTabBarWithViewController:[[MainViewController alloc] init] Title:@"首页" Image:@"one" selectImage:@"one"];
    
    [self addTabBarWithViewController:[[ShopViewController alloc] init] Title:@"商城" Image:@"one" selectImage:@"one"];
    
    [self addTabBarWithViewController:[[ServeViewController alloc] init] Title:@"服务" Image:@"one" selectImage:@"one"];
    
    [self addTabBarWithViewController:[[SelfViewController alloc] init] Title:@"我的" Image:@"one" selectImage:@"one"];
    
    
}



- (void)addTabBarWithViewController:(UIViewController *)vc Title:(NSString *)title Image:(NSString *)imagename selectImage:(NSString *)selectimagename{
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imagename];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectimagename];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
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
