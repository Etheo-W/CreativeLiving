//
//  SearchResultViewController.h
//  CreativeLiving
//
//  Created by Etheo W on 15/11/3.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyLikeGoodsCollectionCell.h"
#import "GoodsDetailViewController.h"

@interface SearchResultViewController : UIViewController<EWNavigationBarDelegate, UIAlertViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, copy) NSString *navigationTitle;
@property (nonatomic, copy) NSString *catID;

@end
