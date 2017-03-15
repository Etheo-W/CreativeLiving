//
//  HomeFiveCollectionCell.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/25.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#define systemWidth self.contentView.width

#import <UIKit/UIKit.h>
#import "HomeCellHeaderView.h"

@interface HomeFiveCollectionCell : UICollectionViewCell

@property (nonatomic, retain) HomeCellHeaderView *headerView;

@property (nonatomic, retain) NSMutableArray *buttonArray;

@end
