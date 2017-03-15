//
//  TabBarViewController.m
//  CreativeLiving
//
//  Created by Etheo W on 15/10/30.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "TabBarViewController.h"

#import "HomeViewController.h"
#import "ChannelViewController.h"
#import "ShopViewController.h"
#import "GridViewController.h"
#import "AccountViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *classArray = @[@"HomeViewController", @"ChannelViewController", @"ShopViewController", @"GridViewController", @"AccountViewController"];
    
    NSArray *imageArray = @[@"xzzm_Tabbar_tabbarHome", @"xzzm_Tabbar_tabbarChannel", @"xzzm_Tabbar_tabbarShop", @"xzzm_Tabbar_tabbarGrid", @"xzzm_Tabbar_tabbarAccount"];
    
    NSArray *selectedImageArray = @[@"xzzm_Tabbar_tabbarHomeSel", @"xzzm_Tabbar_tabbarChannelSel", @"xzzm_Tabbar_tabbarShopSel", @"xzzm_Tabbar_tabbarGridSel", @"xzzm_Tabbar_tabbarAccountSel"];
    
    NSMutableArray *navVCArray = [[NSMutableArray alloc]initWithCapacity:5];
    
    for (int i = 0; i < 5; i++)
    {
        Class class = NSClassFromString(classArray[i]);
        
        UIViewController *VC = [[class alloc]init];
        VC.view.backgroundColor = [UIColor whiteColor];
        
        UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:VC];
        navVC.tabBarItem.image = [UIImage imageNamed:imageArray[i]];
        navVC.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageArray[i]];        
        
        [navVCArray addObject:navVC];
        
        VC.navigationController.navigationBarHidden = YES;
    }
    
    self.viewControllers = navVCArray;
    
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
