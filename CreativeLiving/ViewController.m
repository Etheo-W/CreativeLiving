//
//  ViewController.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/2.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "TabBarViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    TabBarViewController *tabBarVC = [[TabBarViewController alloc]init];
    tabBarVC.tabBar.tintColor = [UIColor getSystemColor];
    
    appDelegate.window.rootViewController = tabBarVC;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
