//
//  EWButton.h
//  CreativeLiving
//
//  Created by Etheo W on 16/5/26.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EWButton : UIView

@property (nonatomic, copy) NSString *goodsID;

@property (nonatomic, retain) UIImageView *bgImageView;

@property (nonatomic, retain) UILabel *priceLabel;

@property (nonatomic, retain) id delegate;

@end

@protocol EWButtonDelegate <NSObject>

- (void)EWButtonClick:(EWButton *)sender;

@end
