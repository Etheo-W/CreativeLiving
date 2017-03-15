//
//  GoodsDetailViewController.h
//  CreativeLiving
//
//  Created by Etheo W on 15/11/4.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaoBaoViewController.h"
#import "ShopDetailViewController.h"

@interface GoodsDetailViewController : UIViewController<EWNavigationBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) NSString *goodsID;

@end
