//
//  ChannelCollectionCell.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/28.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChannelCollectionCell : UICollectionViewCell

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *priceLabel1;
@property (nonatomic, retain) EWImageView *goodsImageView;
@property (nonatomic, retain) UILabel *priceMemoLabel;
@property (nonatomic, retain) UILabel *priceLabel2;
@property (nonatomic, retain) EWURLButton *button1;
@property (nonatomic, retain) EWURLButton *button2;
@property (nonatomic, retain) UILabel *timeLabel;
@property (nonatomic, retain) UILabel *sourceLabel;
@property (nonatomic, retain) UIView *lineView;

@end
