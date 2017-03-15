//
//  EWNavigationBar.h
//  CreativeLiving
//
//  Created by Etheo W on 15/11/2.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EWNavigationBar : UIView

@property (nonatomic, retain) id delegate;


- (id)initWithIsOpaque:(BOOL)opaque WithView:(UIView *)view;

- (id)initWithTitle:(NSString *)navigationTitle WithView:(UIView *)view;

@end

@protocol EWNavigationBarDelegate <NSObject>

- (void)backButtonClick:(UIButton *)sender;

@end