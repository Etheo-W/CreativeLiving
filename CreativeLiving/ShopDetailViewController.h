//
//  ShopDetailViewController.h
//  CreativeLiving
//
//  Created by Etheo W on 15/11/5.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyLikeGoodsCollectionCell.h"
#import "GoodsDetailViewController.h"

@interface ShopDetailViewController : UIViewController<EWNavigationBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, copy)NSString *shopID;

@end


