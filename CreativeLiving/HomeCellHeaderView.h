//
//  HomeCellHeaderView.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/27.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#define shopHeaderImageViewCornerRadius 28
#define shopHeaderImageViewLineWidth 4
#define systemWidth frame.size.width

#import <UIKit/UIKit.h>

@interface HomeCellHeaderView : UIView

@property (nonatomic, retain) UIImageView *shopHeaderImageView;
@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UILabel *tipLabel;

@end
