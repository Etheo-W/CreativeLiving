//
//  HomeSecondController.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/25.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeSiftCollectionCell.h"
#import "HomeFourCollectionCell.h"
#import "HomeFiveCollectionCell.h"
#import "ShopDetailViewController.h"

@interface HomeSecondController : UIViewController<EWNavigationBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, EWButtonDelegate>

@property (nonatomic, assign) int subjectID;
@property (nonatomic, copy) NSString *tipTitle;

@end
