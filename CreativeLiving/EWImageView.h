//
//  EWImageView.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/28.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EWImageView : UIView

@property (nonatomic, copy) NSString *goodsID;

@property (nonatomic, retain) UIImageView *bgImageView;

@property (nonatomic, retain) UIImageView *priceLabelBgImageView;

@property (nonatomic, retain) UILabel *priceLabel;

@property (nonatomic, retain) id delegate;

@end

@protocol EWImageViewDelegate <NSObject>

- (void)EWImageViewTap:(EWImageView *)sender;

@end
